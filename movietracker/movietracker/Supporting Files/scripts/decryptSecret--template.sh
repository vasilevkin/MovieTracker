#! /bin/bash
echo "============================= Decrypt secret keys in script ============================="
openssl enc -aes-256-cbc -d -in ${SRCROOT}/movietracker/Assembly/Secret.swift.enc -out ${SRCROOT}/movietracker/Assembly/Secret.swift -pass pass:YOUR_REALLY_LONG_AND_SECURE_ENCRYPTION_PASSWORD
echo "============================= Decryption of secret keys in script is complete ============================="


# This is a bash shell script, run it in Run Script Phase in Xcode Build Phases

# Use this script to decode file containing secret sensitive information,
# Such as API keys, credentials, Development Team, or any other information that
# can be used to track your privacy

# File paths in this script are relative paths, 
# Xcode should decrypt Secret.swift.enc before building.

# Replace YOUR_REALLY_LONG_AND_SECURE_ENCRYPTION_PASSWORD with your custom password for encryption
# Store this file as well as encryptSecret.sh at the 2 separate secure locations.
# In case you forget you password, you neither decrypt information nor restore your password

# Actual encryptSecret and decryptSecret containing password should be added to .gitignore
# and never published in the public domain.
