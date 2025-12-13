#!/bin/bash

# Check if an argument (folder path) was provided
if [ -z "$1" ]; then
    echo "🚨 ERROR: Please provide the path to the start folder as a parameter."
    echo "Usage: $0 /path/to/your/main/folder"
    exit 1
fi

# The provided path is stored in the variable $1
START_DIR="$1"

# --- Configuration ---
# The ExifTool command you want to apply to every MP4 file
# Example: Removes all metadata. Adjust this to your specific needs!
# WARNING: This command changes or deletes data. Be careful!
EXIFTOOL_COMMAND='exiftool -Keys:GPSCoordinates<GPSCoordinates -overwrite_original'
# If you only want to display the metadata, use:
# EXIFTOOL_COMMAND="exiftool" 
# --- End Configuration ---

echo "Starting search for MP4 files in: $START_DIR"
echo "Command to apply: $EXIFTOOL_COMMAND"
echo "--------------------------------------------------"

# Find all .mp4 files (ignoring case) 
# and execute the exiftool command for each file
find "$START_DIR" -type f -iname "*.mp4" -print0 | while IFS= read -r -d $'\0' file; do
    echo "Processing file: $file"
    # Execute the ExifTool command
    # The $file variable contains the full path to the MP4 file
    $EXIFTOOL_COMMAND "$file"
    
    # Optional: Check the exit code of the exiftool command
    if [ $? -ne 0 ]; then
        echo "🚨 ERROR: The ExifTool command failed for $file."
    fi
    echo "---"
done

echo "✅ Script finished."
