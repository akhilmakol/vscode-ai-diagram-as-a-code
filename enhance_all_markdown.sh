#!/bin/bash

# Script to enhance all markdown files in the directory
# This script will:
# 1. Add proper spacing around code blocks and lists
# 2. Add language specifiers to code blocks
# 3. Fix header formatting
# 4. Ensure consistent emoji usage
# 5. Fix nested code blocks

# Get the directory path
DIR="/Users/nisheethranjan/Projects/Graphics/vscode_ai_graphics"
TEMP_DIR="/tmp/markdown_enhance"

# Create a temporary directory
mkdir -p "$TEMP_DIR"

# Function to enhance a single markdown file
enhance_markdown_file() {
    local file="$1"
    local temp_file="$TEMP_DIR/$(basename "$file").tmp"
    
    echo "Enhancing: $file"
    
    # Make a backup
    cp "$file" "$file.bak"
    
    # Process the file with awk for better formatting
    awk '
    BEGIN { in_outer_code = 0; in_inner_code = 0; code_fence_count = 0; }
    
    # Handle code blocks
    /^```/ { 
        code_fence_count++;
        
        # Handle code fence closing
        if (code_fence_count % 2 == 0) {
            # Closing code fence
            if (in_inner_code) {
                in_inner_code = 0;
            } else if (in_outer_code) {
                in_outer_code = 0;
                print;
                print "";  # Add blank line after code block
                next;
            }
        } else {
            # Opening code fence
            if (in_outer_code && !in_inner_code) {
                in_inner_code = 1;
                # Add a blank line before nested code block if needed
                if (last_line !~ /^$/) { print ""; }
            } else if (!in_outer_code) {
                in_outer_code = 1;
                # Fix code blocks without language specifier
                if ($0 ~ /^```$/) {
                    print "```plaintext";
                    next;
                }
                # Add a blank line before code block if needed
                if (last_line !~ /^$/) { print ""; }
            }
        }
        print;
        last_line = $0;
        next;
    }
    
    # Handle numbered lists
    /^[0-9]+\./ {
        # Add blank line before list start
        if (last_line !~ /^$/ && last_line !~ /^[0-9]+\./) { 
            print ""; 
        }
        print;
        last_line = $0;
        next;
    }
    
    # Handle bullet lists
    /^- / {
        # Add blank line before list start
        if (last_line !~ /^$/ && last_line !~ /^- /) { 
            print ""; 
        }
        print;
        last_line = $0;
        next;
    }
    
    # Add blank line after lists if next line is not a list item or blank
    {
        if ((last_line ~ /^[0-9]+\./ || last_line ~ /^- /) && 
            $0 !~ /^[0-9]+\./ && $0 !~ /^- / && $0 !~ /^$/) {
            print "";
        }
        print;
        last_line = $0;
    }
    ' "$file" > "$temp_file"
    
    # Replace the original with the fixed version
    cp "$temp_file" "$file"
}

# Process all markdown files in the directory (excluding the prompt_templates directory)
find "$DIR" -maxdepth 1 -name "*.md" -type f | while read -r file; do
    enhance_markdown_file "$file"
done

# Process all markdown files in the prompt_templates directory
find "$DIR/prompt_templates" -name "*.md" -type f | while read -r file; do
    enhance_markdown_file "$file"
done

echo "All markdown files have been enhanced."

# Clean up
rm -rf "$TEMP_DIR"
