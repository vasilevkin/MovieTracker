#! /bin/bash
# This is bash shell script, run it in terminal or in Run Script Phase in Xcode Build Phases
# Note: Xcode shows these values in 
# Xcode menu > Preferences... > Locations > Custom Paths
# Xcode does not hot reload these values automatically. You must restart Xcode to get the changes.

# Add a dictionary entry for DEVELOPMENT_TEAM with a display name
# 1234567890 - replace this with your actual development team id
defaults write com.apple.dt.Xcode IDEApplicationwideBuildSettings -dict-add DEVELOPMENT_TEAM 1234567890

# Add description for key, so Xcode could show it in a Custom Paths window.
defaults write com.apple.dt.Xcode IDESourceTreeDisplayNames -dict-add DEVELOPMENT_TEAM "'Sergey Vasilevkin (Personal Team)'"

# View all stored values
defaults read com.apple.dt.Xcode IDEApplicationwideBuildSettings
defaults read com.apple.dt.Xcode IDESourceTreeDisplayNames

# View the values which match DEVELOPMENT_TEAM key only
defaults read com.apple.dt.Xcode IDEApplicationwideBuildSettings | grep DEVELOPMENT_TEAM
defaults read com.apple.dt.Xcode IDESourceTreeDisplayNames | grep DEVELOPMENT_TEAM