#!/bin/bash

# Script to add navigation and Table of Contents to markdown files
# This will improve document navigation and cross-referencing

DIR="/Users/nisheethranjan/Projects/Graphics/vscode_ai_graphics"
TEMP_DIR="/tmp/nav_enhance"

# Create a temporary directory
mkdir -p "$TEMP_DIR"

# Function to generate table of contents for a file
generate_toc() {
    local file="$1"
    local toc=""
    
    # Extract all headings (levels 1-4 only) and format as a TOC
    while IFS= read -r line; do
        if [[ $line =~ ^(#{1,4})\ +(.*) ]]; then
            level=${#BASH_REMATCH[1]}
            heading=${BASH_REMATCH[2]}
            
            # Clean up heading for anchor link (remove special chars, lowercase, replace spaces with dashes)
            anchor=$(echo "$heading" | tr -d '[:punct:]' | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | sed 's/[^a-z0-9-]//g')
            
            # Create indentation based on heading level
            indent=""
            for ((i=1; i<level; i++)); do
                indent="$indent  "
            done
            
            # Add to TOC
            toc="${toc}${indent}- [${heading}](#${anchor})\n"
        fi
    done < "$file"
    
    echo -e "$toc"
}

# Function to add navigation section
add_navigation() {
    local file="$1"
    local temp_file="$TEMP_DIR/$(basename "$file").tmp"
    local filename=$(basename "$file")
    
    echo "Adding navigation to: $file"
    
    # Check if file already has a navigation section
    if grep -q "^## Navigation" "$file"; then
        # Replace existing navigation section
        sed -i '' '/^## Navigation/,/^##/{ /^## Navigation/b; /^##/!d; }' "$file"
    fi
    
    # Create navigation content
    nav_content="\n## 🧭 Navigation\n\n"
    nav_content="${nav_content}- [🏠 Back to Main Page](README.md)\n"
    nav_content="${nav_content}- **Related Documents:**\n"
    
    # Add links to related documents based on content similarity
    case "$filename" in
        "advanced_ai_prompting.md")
            nav_content="${nav_content}  - [AI Diagram Generation Guide](ai_diagram_generation_guide.md)\n"
            nav_content="${nav_content}  - [Custom Instructions Guide](custom_instructions_guide.md)\n"
            nav_content="${nav_content}  - [Workflow Example](workflow_example.md)\n"
            ;;
        "ai_diagram_generation_guide.md")
            nav_content="${nav_content}  - [Advanced AI Prompting](advanced_ai_prompting.md)\n"
            nav_content="${nav_content}  - [Diagram Best Practices](diagram_best_practices.md)\n"
            nav_content="${nav_content}  - [Practical Mermaid Guide](practical_mermaid_guide.md)\n"
            ;;
        "diagram_best_practices.md")
            nav_content="${nav_content}  - [AI Diagram Generation Guide](ai_diagram_generation_guide.md)\n"
            nav_content="${nav_content}  - [Diagram Validation Guide](diagram_validation_guide.md)\n"
            nav_content="${nav_content}  - [Practical Mermaid Guide](practical_mermaid_guide.md)\n"
            ;;
        "practical_mermaid_guide.md")
            nav_content="${nav_content}  - [Diagram Best Practices](diagram_best_practices.md)\n"
            nav_content="${nav_content}  - [Advanced Diagram Examples](advanced_diagram_examples.md)\n"
            nav_content="${nav_content}  - [Flowchart Example](flowchart_example.md)\n"
            nav_content="${nav_content}  - [Sequence Diagram Example](sequence_diagram_example.md)\n"
            ;;
        "diagram_faq.md")
            nav_content="${nav_content}  - [Troubleshooting Guide](troubleshooting_guide.md)\n"
            nav_content="${nav_content}  - [Diagram Validation Guide](diagram_validation_guide.md)\n"
            nav_content="${nav_content}  - [VS Code Setup Guide](vscode_setup_guide.md)\n"
            ;;
        "workflow_example.md")
            nav_content="${nav_content}  - [Workflow Integration](workflow_integration.md)\n"
            nav_content="${nav_content}  - [Implementation Guide](implementation_guide.md)\n"
            nav_content="${nav_content}  - [Advanced AI Prompting](advanced_ai_prompting.md)\n"
            ;;
        "README.md")
            # For README, link to all main sections
            nav_content="${nav_content}  - [Getting Started](#getting-started)\n"
            nav_content="${nav_content}  - [Diagrams](#diagrams)\n"
            nav_content="${nav_content}  - [AI Integration](#ai-integration)\n"
            nav_content="${nav_content}  - [Examples](#examples)\n"
            nav_content="${nav_content}  - [Resources](#resources)\n"
            ;;
        *)
            # Default links for other files
            nav_content="${nav_content}  - [AI Diagram Generation Guide](ai_diagram_generation_guide.md)\n"
            nav_content="${nav_content}  - [Diagram Best Practices](diagram_best_practices.md)\n"
            nav_content="${nav_content}  - [VS Code Setup Guide](vscode_setup_guide.md)\n"
            ;;
    esac
    
    # Generate TOC header if file is large enough
    line_count=$(wc -l < "$file")
    if [ "$line_count" -gt 30 ]; then
        # Generate TOC
        toc=$(generate_toc "$file")
        toc_content="\n## 📑 Table of Contents\n\n${toc}\n"
        
        # Find the first heading to insert TOC after it
        first_heading=$(grep -n "^# " "$file" | head -1 | cut -d: -f1)
        if [ -n "$first_heading" ]; then
            # Insert TOC after the first heading and any text immediately after it
            first_heading=$((first_heading + 2))
            sed -i '' "${first_heading}i\\
${toc_content}
" "$file"
        fi
    fi
    
    # Append navigation section at the end of the file
    echo -e "\n${nav_content}" >> "$file"
}

# Process all markdown files in the directory (excluding the prompt_templates directory)
find "$DIR" -maxdepth 1 -name "*.md" -type f | while read -r file; do
    add_navigation "$file"
done

# For prompt_templates directory files, create a simpler navigation back to parent
find "$DIR/prompt_templates" -name "*.md" -type f | while read -r file; do
    if [ "$(basename "$file")" != "README.md" ]; then
        echo -e "\n## 🧭 Navigation\n\n- [Back to Prompt Templates](README.md)" >> "$file"
    else
        echo -e "\n## 🧭 Navigation\n\n- [Back to Main Documentation](../README.md)" >> "$file"
    fi
done

echo "Navigation and Table of Contents have been added to all markdown files."

# Clean up
rm -rf "$TEMP_DIR"
