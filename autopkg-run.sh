#!/bin/bash
set -ev

# Install AutoPkg
git clone https://github.com/autopkg/autopkg.git
cd autopkg && sudo ./Scripts/install.sh
cd

# Add default recipes
# autopkg repo-add recipes

# Add VirusTotalAnalyzer
autopkg repo-add https://github.com/hjuutilainen/autopkg-virustotalanalyzer.git
defaults write com.github.autopkg VIRUSTOTAL_AUTO_SUBMIT -bool true
defaults write com.github.autopkg VIRUSTOTAL_SLEEP_SECONDS -int 5

# Get recipes to check
cd "${HOME}"
RECIPES_PATH="${HOME}/hjuutilainen-recipes"
git clone https://github.com/autopkg/hjuutilainen-recipes.git "${RECIPES_PATH}"

# Run recipes
autopkg run -v --post "io.github.hjuutilainen.VirusTotalAnalyzer/VirusTotalAnalyzer" ${RECIPES_PATH}/{A,B,C}*/*.download.recipe
