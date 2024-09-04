#!/bin/bash

# Set correct character encoding
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Function: Convert string to lowercase
to_lowercase() {
    echo "$1" | tr '[:upper:]' '[:lower:]'
}

# Function: Copy .ai folder
copy_ai_folder() {
    local root_dir="$1"
    if [ -d ".ai" ]; then
        cp -r .ai "$root_dir"
        echo "Copied .ai folder to $root_dir"
    else
        echo "Error: .ai folder not found in the current directory"
        exit 1
    fi
}

# Function: Copy language-specific .cursorrules file
copy_language_rules() {
    local root_dir="$1"
    local language="$2"
    local language_dir=$(to_lowercase "$language")
    
    echo "Looking for /$language_dir/.cursorrules file..."
    cursorrules_file=$(pwd)/$language_dir/.cursorrules
    echo $cursorrules_file
    if [ -f "$cursorrules_file" ]; then
        cp "$cursorrules_file" "$root_dir"
        echo "Copied $language_dir/.cursorrules file to $root_dir"
    else
        echo "Error: $language_dir/.cursorrules file not found"
        exit 1
    fi
}

# Function: Display language selection menu
select_language() {
    echo "Please select a language:" >&2
    select lang in "Solidity" "Swift" "Exit"; do
        case $lang in
            "Solidity")
                echo "solidity"
                return 
                ;;
            "Swift")
                echo "swift"
                return
                ;;
            "Exit")
                echo "exit"
                return
                ;;
            *)
                echo "Invalid selection, please try again" >&2
                ;;
        esac
    done
}

# Main program
echo "Please enter the root directory path:"
read -r root_dir

if [ ! -d "$root_dir" ]; then
    echo "Error: Specified root directory does not exist"
    exit 1
fi

language=$(select_language)

if [ "$language" = "exit" ]; then
    echo "Operation cancelled"
    exit 0
fi

echo "Selected language: $language"

copy_ai_folder "$root_dir"
copy_language_rules "$root_dir" "$language"

echo "Setup complete!"