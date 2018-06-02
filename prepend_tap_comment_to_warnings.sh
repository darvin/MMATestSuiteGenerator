#!/bin/bash

node_modules/.bin/duh 'line => { if (line.length==0) { return null } else { return line.replace(/^((?!ok|not\ ok|\s{4,8}|#)|(?=\s{10})).*$/g, "#! $&") } }'