#!/usr/bin/env python

import os
import errno

def get_versions(path):
    results_dir = os.path.join(path, "Results")
    return os.listdir(results_dir)

def get_tests(path):
    tests_dir = os.path.join(path, "Tests")
    return os.listdir(tests_dir)

if __name__ == '__main__':
    import json
    import sys
    path = "output"
    file = open("output/__index.json","w") 

    file.write(json.dumps({
        "ResultsVersions":get_versions(path),
        "Tests":get_tests(path),
        }, indent=2, sort_keys=True))
    file.close()