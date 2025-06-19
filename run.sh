#!/usr/bin/bash
# ---- Check current user and directory ----
# Check that user is root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root. Please use sudo."
    exit 1
fi
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

# verify that the script is run from the correct directory
if [ ! -f "$SCRIPT_DIR/requirements.txt" ]; then
    echo "This script must be run from the project root directory."
    exit 1
fi
# ---- Check Python version ----
# Check that Python 3 is installed
if ! command -v python3 &> /dev/null; then
    echo "Python 3 is not installed. Please install Python 3 and try again."
    exit 1
fi
# ---- Install dependencies ----
echo "Installing dependencies..."
if ! pip install -r "$SCRIPT_DIR/requirements.txt"; then
    
fi
