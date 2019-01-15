
# Hole punch

 ![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)  [![Launch Rstudio binder](http://mybinder.org/badge.svg)](https://mybinder.org/v2/gh/benmarwick/holepunch/master?urlpath=rstudio) 

This helper R package is designed to make your R project or  compendium binder ready. It provides some very simple functionality to:

- `write_compendium_description` and `get_dependencies` Create a description file in case this isn't a package
- `write_dockerfile` Writes out a Dockerfile that is binderhub ready
- `build_binder` Kicks off a binder build
- `generate_badge` And adds a badge with a Rstudio endpoint 
