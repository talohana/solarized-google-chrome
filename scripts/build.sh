#!/bin/bash

# This script builds zip files for each theme in the themes directory.

# Get the absolute path of the project's root directory
# This makes the script runnable from any directory.
ROOT_DIR=$(cd "$(dirname "$0")/.." && pwd)
THEMES_DIR="$ROOT_DIR/themes"
DIST_DIR="$ROOT_DIR/dist"

# Create a dist directory if it doesn't exist and clear it if it does
echo "Creating distribution directory at $DIST_DIR"
rm -rf "$DIST_DIR"
mkdir -p "$DIST_DIR"

# Loop through each theme directory in the themes directory
for theme_dir in "$THEMES_DIR"/*/; do
  # Check if it is a directory
  if [ -d "$theme_dir" ]; then
    # Get the theme name from the directory path
    theme_name=$(basename "$theme_dir")

    echo "Building $theme_name.zip..."
    # Go into the theme directory and create a zip file of its contents
    (cd "$theme_dir" && zip -r "$DIST_DIR/$theme_name.zip" ./*)
  fi
done

echo "All themes have been built and are located in the $DIST_DIR directory."
