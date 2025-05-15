#!/bin/bash

# Script to add visual enhancements to markdown files
# This will add horizontal separators, callout boxes, and improve visual structure

DIR="/Users/nisheethranjan/Projects/Graphics/vscode_ai_graphics"
TEMP_DIR="/tmp/visual_enhance"

# Create a temporary directory
mkdir -p "$TEMP_DIR"

# Function to add visual enhancements to a file
enhance_visuals() {
    local file="$1"
    local temp_file="$TEMP_DIR/$(basename "$file").tmp"
    
    echo "Enhancing visuals in: $file"
    
    # Make a backup
    cp "$file" "$file.visual.bak"
    
    # Add horizontal separators between major sections
    awk '
    BEGIN { prev_line_is_h2 = 0; }
    {
        # Check if the previous line was a level 2 heading and current line is not empty
        if (prev_line_is_h2 && $0 != "") {
            prev_line_is_h2 = 0;
        }
        
        # If this is a level 2 heading and not the first one in the file
        if ($0 ~ /^## / && h2_count > 0) {
            # Add separator before the heading
            print "";
            print "---";
            print "";
        }
        
        # Count level 2 headings
        if ($0 ~ /^## /) {
            h2_count++;
            prev_line_is_h2 = 1;
        }
        
        # Print the current line
        print $0;
    }
    ' "$file" > "$temp_file"
    
    # Replace original with enhanced version
    cp "$temp_file" "$file"
    
    # Convert key points into callout boxes
    # Look for specific keywords and patterns that might benefit from callout formatting
    awk '
    BEGIN { in_list = 0; list_buffer = ""; list_type = ""; }
    
    # Detect start of a list that might benefit from being a callout
    /^- (Note|Important|Tip|Warning|Best Practice|Remember|Key Point|Be careful|Caution):/ {
        if (!in_list) {
            in_list = 1;
            
            # Determine the callout type based on keyword
            if ($0 ~ /Note:/ || $0 ~ /Key Point:/) {
                list_type = "💡 **Note**";
            } else if ($0 ~ /Important:/ || $0 ~ /Remember:/) {
                list_type = "⚠️ **Important**";
            } else if ($0 ~ /Tip:/ || $0 ~ /Best Practice:/) {
                list_type = "💪 **Pro Tip**";
            } else if ($0 ~ /Warning:/ || $0 ~ /Be careful:/ || $0 ~ /Caution:/) {
                list_type = "🚨 **Warning**";
            } else {
                list_type = "📌 **Key Point**";
            }
            
            # Extract the content after the keyword
            content = $0;
            gsub(/^- (Note|Important|Tip|Warning|Best Practice|Remember|Key Point|Be careful|Caution): /, "", content);
            
            # Start building the callout box
            list_buffer = "> " list_type "\n> \n> " content "\n";
        } else {
            # If already in a list, continue adding to buffer
            content = $0;
            gsub(/^- /, "", content);
            list_buffer = list_buffer "> " content "\n";
        }
        next;
    }
    
    # Continue adding to the list buffer if in a list and line starts with -
    /^- / {
        if (in_list) {
            content = $0;
            gsub(/^- /, "", content);
            list_buffer = list_buffer "> " content "\n";
            next;
        }
    }
    
    # If we reach a non-list line and we were in a list, print the buffered list and reset
    {
        if (in_list) {
            print list_buffer;
            in_list = 0;
            list_buffer = "";
            list_type = "";
        }
        print;
    }
    
    # End of file - print any remaining buffer
    END {
        if (in_list) {
            print list_buffer;
        }
    }
    ' "$file" > "$temp_file"
    
    # Replace original with enhanced version
    cp "$temp_file" "$file"
    
    # Convert Example blocks to formatted code examples
    awk '
    BEGIN { in_example = 0; example_buffer = ""; }
    
    # Detect start of an example section
    /^#### Example/ {
        in_example = 1;
        example_title = $0;
        gsub(/^#### /, "", example_title);
        example_buffer = "\n<details>\n<summary>" example_title " (click to expand)</summary>\n\n";
        next;
    }
    
    # If in example and we hit a new heading, end the example
    /^##/ {
        if (in_example) {
            example_buffer = example_buffer "\n</details>\n";
            print example_buffer;
            in_example = 0;
            example_buffer = "";
        }
        print;
        next;
    }
    
    # Add content to example buffer if in example, otherwise print normally
    {
        if (in_example) {
            example_buffer = example_buffer $0 "\n";
        } else {
            print;
        }
    }
    
    # End of file - print any remaining buffer
    END {
        if (in_example) {
            example_buffer = example_buffer "\n</details>\n";
            print example_buffer;
        }
    }
    ' "$file" > "$temp_file"
    
    # Replace original with enhanced version
    cp "$temp_file" "$file"
    
    # Add a decorative footer to the file
    echo -e "\n\n---\n\n<div align=\"center\">\n\n*Visually Enhanced Documentation | VS Code AI Graphics*\n\n</div>" >> "$file"
}

# Process all markdown files in the directory (excluding the prompt_templates directory)
find "$DIR" -maxdepth 1 -name "*.md" -type f | while read -r file; do
    enhance_visuals "$file"
done

# Process all markdown files in the prompt_templates directory
find "$DIR/prompt_templates" -name "*.md" -type f | while read -r file; do
    enhance_visuals "$file"
done

echo "Visual enhancements have been added to all markdown files."

# Clean up
rm -rf "$TEMP_DIR"
