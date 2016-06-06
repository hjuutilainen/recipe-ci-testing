#!/bin/bash

# Install AutoPkg
git clone https://github.com/autopkg/autopkg.git
cd autopkg && sudo ./Scripts/install.sh

autopkg repo-add recipes
