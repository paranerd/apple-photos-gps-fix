# Apple Photos GPS Data Setter

This script recursively finds all `.mp4` files in a specified directory and applies an ExifTool command to them. The primary purpose of this tool is to add GPS data to video files in a format that Apple Photos can read and interpret correctly upon import.

## Usage

```bash
./set_gps_data.sh /path/to/your/main/folder
```

## Configuration

You can configure the ExifTool command to be executed by modifying the `EXIFTOOL_COMMAND` variable in the `set_gps_data.sh` script.
