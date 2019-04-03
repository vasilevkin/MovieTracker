#! /bin/bash
echo "= Start encryption ="
openssl enc -aes-256-cbc -salt -in /Users/svasilev/developer/MovieTracker/movietracker/movietracker/Assembly/Secret.swift -out /Users/svasilev/developer/MovieTracker/movietracker/movietracker/Assembly/Secret.swift.enc -pass pass:YOUR_REALLY_LONG_AND_SECURE_ENCRYPTION_PASSWORD
echo "***** Encryption successful! *****"


# This is a bash shell script, run it in terminal or in Run Script Phase in Xcode Build Phases

# Use this script to manually encode file containing secret sensitive information,
# Such as API keys, credentials, Development Team, or any other information that
# can be used to track your privacy

# File paths in this script are hardcoded absolute paths, 
# Because we run this script manually after changes in Secret.swift

# Replace YOUR_REALLY_LONG_AND_SECURE_ENCRYPTION_PASSWORD with your custom password for encryption
# Store this file as well as decryptSecret.sh at the 2 separate secure locations.
# In case you forget you password, you neither decrypt information nor restore your password

# Actual encryptSecret and decryptSecret containing password should be added to .gitignore
# and never published in the public domain.
