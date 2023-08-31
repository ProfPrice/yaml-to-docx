#!/bin/zsh

# Variables
SRC_PATH="src/"
DIST_PATH="dist/"
PHAR_FILE="dist/yamltodocx.phar"
TMP_PATH="tmp/"

# Setup Directories
if [[ -d $DIST_PATH ]]; then
    rm -rf $DIST_PATH
fi

mkdir -p $TMP_PATH

# Prepare Files
cp -R index.php $SRC_PATH composer.json LICENSE $TMP_PATH

# Install dependencies in the root directory
composer install --no-dev

# Copy the vendor directory to TMP_PATH
cp -R vendor $TMP_PATH

# Build the .phar File
php phar.php $TMP_PATH index.php $PHAR_FILE
rm $PHAR_FILE
mv "$PHAR_FILE.gz" $PHAR_FILE

# Cleanup
rm -rf $TMP_PATH
