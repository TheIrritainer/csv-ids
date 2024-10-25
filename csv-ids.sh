#!/bin/bash

copy_to_clipboard() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        pbcopy
    else
        xclip -selection clipboard
    fi
}

process_input() {
    local content
    # Check if the first line is a header (non-numeric)
    if [[ $(head -n 1 <<< "$1") =~ ^[^0-9]+$ ]]; then
        content=$(tail -n +2 <<< "$1")
    else
        content="$1"
    fi
    # Replace line breaks with commas and remove any trailing comma
    echo "$content" | tr '\n' ',' | sed 's/,$//'
}

output_to_clipboard=true

# Parse options
while [[ $# -gt 0 ]]; do
    case $1 in
        --print)
            output_to_clipboard=false
            shift
            ;;
        *)
            # Assume the argument is a file if not --print
            file=$1
            shift
            ;;
    esac
done

if [[ -n "$file" ]]; then
    if [[ ! -f "$file" ]]; then
        echo "Error: File not found"
        exit 1
    fi
    # Read file content
    input=$(cat "$file")
else
    # Read piped content
    input=$(cat)
fi

# Process input
output=$(process_input "$input")

if $output_to_clipboard; then
    echo -n "$output" | copy_to_clipboard
    echo "IDs copied to clipboard"
else
    echo "$output"
fi
