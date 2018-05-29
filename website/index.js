$(function(){
	function testsForVersion(versionName, cb) {
		function getStatsDiv(s) {
			console.log(s);
		  var stats = $('<dl class=stats></dl>');
		  stats.append($('<dt>Total</dt>'));
		  stats.append($('<dd>'+s.Total+'</dd>'));
		  stats.append($('<dt>Failed</dt>'));
		  stats.append($('<dd>'+s.Failed+'</dd>'));
		  stats.append($('<dt>Disabled</dt>'));
		  stats.append($('<dd>'+s.Disabled+'</dd>'));
		  return stats;
		}
		function getTests(testFileName, cb) {
			$.getJSON( "Results/"+versionName+"/"+testFileName, function( data ) {
				var stats = getStatsDiv(data.Stats);
				var allTogether = $('<div>');
				allTogether.append($('<H3>'+testFileName+'</H3>'));
		  		allTogether.append(stats);
		  		function getTestCase(tc) {
		  			if (tc.Comment) {
		  				return $('<div class="comment">'+tc.Comment+'<div>');
		  			} else {
		  				var t = tc.Test;
		  				var tClass = "disabled";
		  				if (!t[4]) {
		  					if (t[5]) {
		  						tClass = "success";
		  					} else {
								tClass = "failure";
		  					}
		  				}
		  				var div = $('<dl class=test-'+tClass+'></dl>');
		  				  div.append($('<dt>'+tClass+'</dt>'));

						  div.append($('<dt>In</dt>'));
						  div.append($('<dd><pre><code>'+t[0]+'</pre></code></dd>'));
						  div.append($('<dt>Out</dt>'));
						  div.append($('<dd><pre><code>'+t[1]+'</pre></code></dd>'));
						  div.append($('<dt>In [evaluated]</dt>'));
						  div.append($('<dd><pre><code>'+t[2]+'</pre></code></dd>'));
						  div.append($('<dt>Out [evaluated]</dt>'));
						  div.append($('<dd><pre><code>'+t[3]+'</pre></code></dd>'));
						  return div;
		  			}
		  		}

		  		var tests = data.Tests.map(getTestCase);
		  		allTogether.append(tests);
		  		cb(allTogether);

			});

		}
		$.getJSON( "Results/"+versionName+"/__index.json", function( data ) {
			console.log("Result for version: ", versionName, data);
		  var stats = getStatsDiv(data.Stats);
		  var tests = $('<div class=tests></div>');
		  $.each(data.Stats.TestFiles, function(i, testFile) {
		  	getTests(testFile, function(content) {
		  		tests.append(content);
		  	})
		  })
		  var allTogether = $('<div>');
		  allTogether.append([stats, tests]);
		  cb(allTogether);
		});
	}
	function processVersion(versionName) {
		var v = $('<div> <h2>'+versionName+'</h2></div>');
		testsForVersion(versionName, function(content) {
			v.append(content);
		});

		return v;

	}
	function processTest(testName) {
		return $('<li><a href="Tests/'+testName+'">'+testName+'</a></li>');
	}
	$.getJSON( "__index.json", function( data ) {
	  var items = [];
	  $("#results").append(data.ResultsVersions.map(processVersion));
	  $("#tests").append(data.Tests.map(processTest));

	});

});