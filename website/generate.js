#!/usr/bin/env node

const Handlebars = require('handlebars')
const fs  = require("fs")
const path  = require("path")
const { lstatSync, readdirSync } = require('fs')
const { join } = require('path')
const util = require('util')


const isDirectory = source => lstatSync(source).isDirectory()
const getDirectories = source => readdirSync(source).map(name => join(source, name)).filter(isDirectory)
const getHtmls = source => readdirSync(source).map(name => join(source, name)).filter( f => { return path.extname(f)==".html" && path.basename(f)!="_ALL_TESTS_CONCAT.html" } )

function getAllTests() {
	const rootPath = path.join(__dirname,"..","output");
	function getTest(p) {
		const b = path.basename(p);
		const bNoExt = path.basename(p, ".html");
		const tapFile = path.join(path.dirname(p), bNoExt+".tap");
		const jsonFile = tapFile + ".json";
		const jsonObj = JSON.parse(fs.readFileSync(jsonFile, 'utf8'));

		return {
			"failed":jsonObj.stats.failures>0,
			"stats":jsonObj.stats,
			"url":path.relative(rootPath,p),
			"name":b.replace("_Tests.html",""),
			"srcUrl": path.relative(rootPath,path.join(rootPath, "Tests", bNoExt+".m")),
			"tapUrl":path.relative(rootPath,tapFile)
		}
	}
	function getSystem(p, overrideName) {
		return {
			"name":overrideName || path.basename(p).replace("_", " "),
			"allTestsUrl":path.relative(rootPath, join(p, "_ALL_TESTS_CONCAT.html")),
			"tests": getHtmls(p).map(getTest)
		}
	}
	function getAllSystems(p) {
		return getDirectories(p).map(getSystem)
	}
	var systems = getAllSystems(path.join(__dirname,"..", "output", "Results"));
	const generationLogs = getSystem(path.join(__dirname,"..", "output", "Tests", "GenerationLogs"), "Test Suite Generation");
	
	systems.push(generationLogs)
	return {
		"systems":systems
	}
}

function writeIndex(obj) {
	const templateText = fs.readFileSync(path.join(__dirname, "index.html")).toString()
	const template = Handlebars.compile(templateText);
	const result = template(obj);
	fs.writeFileSync(path.join(__dirname,"..","output", "index.html"), result);
}

writeIndex(getAllTests());

console.log("index.html generated");
// const obj = getAllTests();

// console.log(util.inspect(obj, false, null))
