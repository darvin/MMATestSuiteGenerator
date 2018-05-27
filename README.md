

   -  Add file from `/Applications/Mathematica.app/Contents/Documentation/English/System/ReferencePages/Symbols/` to `./WHITELIST`
   - Run: `make generate-tests-local`
   - Find generated from docstrings tests in `./output/`.
   - *Note*: There is bunch of stuff in `Dockerfile` and `Makefile`, it would be possible to generate and run tests on CI, but MMA 10 provided with raspberri doesnt have `NotebookImport`, `export_tests_from_docs.m` should be adapted to use `Notebook` and `Import` separately :(