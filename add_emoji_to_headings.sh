#!/bin/bash

# Script to add emojis to headings in markdown files
# This will make the documents more visually appealing

DIR="/Users/nisheethranjan/Projects/Graphics/vscode_ai_graphics"
TEMP_DIR="/tmp/emoji_enhance"

# Create a temporary directory
mkdir -p "$TEMP_DIR"

# Dictionary of emoji mappings based on common keywords
declare -A emoji_map

# General document sections
emoji_map["introduction"]="🎯"
emoji_map["overview"]="🔭"
emoji_map["getting started"]="🚀"
emoji_map["prerequisites"]="📋"
emoji_map["installation"]="💿"
emoji_map["configuration"]="⚙️"
emoji_map["usage"]="🔍"
emoji_map["features"]="✨"
emoji_map["examples"]="💡"
emoji_map["best practices"]="🏆"
emoji_map["tips"]="💡"
emoji_map["troubleshooting"]="🔧"
emoji_map["faq"]="❓"
emoji_map["conclusion"]="🏁"
emoji_map["summary"]="📝"
emoji_map["next steps"]="👣"
emoji_map["references"]="📚"
emoji_map["resources"]="🔗"
emoji_map["contributing"]="🤝"
emoji_map["license"]="📄"

# Diagram specific
emoji_map["diagram"]="📊"
emoji_map["flowchart"]="🔄"
emoji_map["sequence"]="⏱️"
emoji_map["class"]="🧩"
emoji_map["entity"]="🗃️"
emoji_map["architecture"]="🏛️"
emoji_map["component"]="🧰"
emoji_map["state"]="🔄"
emoji_map["activity"]="🔀"
emoji_map["use case"]="👤"
emoji_map["deployment"]="🚢"
emoji_map["data flow"]="📡"
emoji_map["er diagram"]="🗄️"
emoji_map["uml"]="📐"
emoji_map["mermaid"]="🧜‍♀️"
emoji_map["plantuml"]="🌱"
emoji_map["prompting"]="🤖"
emoji_map["ai"]="🧠"
emoji_map["vscode"]="💻"
emoji_map["visual studio code"]="💻"
emoji_map["setup"]="🔌"
emoji_map["guide"]="📘"
emoji_map["tutorial"]="👨‍🏫"
emoji_map["workflow"]="⚡"
emoji_map["process"]="⚙️"
emoji_map["case study"]="🔬"
emoji_map["implementation"]="🛠️"
emoji_map["integration"]="🔌"
emoji_map["comparison"]="⚖️"
emoji_map["validation"]="✅"

# Function to add emojis to headings if they don't already have one
enhance_headings_with_emoji() {
    local file="$1"
    local temp_file="$TEMP_DIR/$(basename "$file").tmp"
    
    echo "Adding emojis to headings in: $file"
    
    # Process the file line by line
    while IFS= read -r line; do
        # Check if line is a heading
        if [[ $line =~ ^#+ ]]; then
            # Only process if the heading doesn't already have an emoji
            if ! [[ $line =~ \p{Emoji} ]]; then
                # Extract heading text without the markdown symbols
                heading_text=$(echo "$line" | sed -E 's/^#+[ ]*//')
                heading_text_lower=$(echo "$heading_text" | tr '[:upper:]' '[:lower:]')
                
                # Find matching emoji
                matched_emoji=""
                for key in "${!emoji_map[@]}"; do
                    if [[ $heading_text_lower =~ $key ]]; then
                        matched_emoji="${emoji_map[$key]}"
                        break
                    fi
                done
                
                # If no specific match found, use a generic emoji based on heading level
                if [[ -z $matched_emoji ]]; then
                    # Count the number of # to determine heading level
                    heading_level=$(echo "$line" | grep -o '^#+' | wc -c)
                    case $heading_level in
                        1) matched_emoji="📘" ;; # H1 - Book
                        2) matched_emoji="📋" ;; # H2 - Clipboard
                        3) matched_emoji="🔹" ;; # H3 - Blue diamond
                        4) matched_emoji="📌" ;; # H4 - Pin
                        5) matched_emoji="🔸" ;; # H5 - Orange diamond
                        *) matched_emoji="•" ;; # Other levels
                    esac
                fi
                
                # Add emoji to heading
                hash_marks=$(echo "$line" | grep -o '^#+')
                line="$hash_marks $matched_emoji $heading_text"
            fi
        fi
        echo "$line"
    done < "$file" > "$temp_file"
    
    # Replace the original with the enhanced version
    cp "$temp_file" "$file"
}

# Process all markdown files in the directory (excluding the prompt_templates directory)
find "$DIR" -maxdepth 1 -name "*.md" -type f | while read -r file; do
    enhance_headings_with_emoji "$file"
done

# Process all markdown files in the prompt_templates directory
find "$DIR/prompt_templates" -name "*.md" -type f | while read -r file; do
    enhance_headings_with_emoji "$file"
done

echo "Emojis have been added to headings in all markdown files."

# Clean up
rm -rf "$TEMP_DIR"
