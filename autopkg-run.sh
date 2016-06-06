#!/bin/bash

# Install AutoPkg
git clone https://github.com/autopkg/autopkg.git
cd autopkg && sudo ./Scripts/install.sh

# Add default recipes
autopkg repo-add recipes

# Add VirusTotalAnalyzer
autopkg repo-add https://github.com/hjuutilainen/autopkg-virustotalanalyzer.git
defaults write com.github.autopkg VIRUSTOTAL_AUTO_SUBMIT -bool true
defaults write com.github.autopkg VIRUSTOTAL_SLEEP_SECONDS -int 5

# Run recipes
autopkg run -v --post "io.github.hjuutilainen.VirusTotalAnalyzer/VirusTotalAnalyzer" Firefox.download
