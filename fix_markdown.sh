#!/bin/bash

# Script to fix markdown formatting issues in advanced_ai_prompting.md
# This will add proper spacing around code blocks and lists

file="/Users/nisheethranjan/Projects/Graphics/vscode_ai_graphics/advanced_ai_prompting.md"
temp_file="/tmp/advanced_ai_prompting.tmp"

# Fix code block language specification
sed 's/```\([^a-z]\)/```plaintext\1/g' "$file" > "$temp_file"

# Ensure blank lines before code blocks
sed -i '' 's/\([^\n]\)\n```/\1\n\n```/g' "$temp_file"

# Ensure blank lines after code blocks
sed -i '' 's/```\n\([^\n]\)/```\n\n\1/g' "$temp_file"

# Ensure blank lines before lists
sed -i '' 's/\([^\n]\)\n\( *[-*] \)/\1\n\n\2/g' "$temp_file"

# Ensure blank lines after lists
sed -i '' 's/\( *[-*] .*\)\n\([^-* ]\)/\1\n\n\2/g' "$temp_file"

# Ensure blank lines before numbered lists
sed -i '' 's/\([^\n]\)\n\( *[0-9]\+\. \)/\1\n\n\2/g' "$temp_file"

# Ensure blank lines after numbered lists
sed -i '' 's/\( *[0-9]\+\. .*\)\n\([^0-9 ]\)/\1\n\n\2/g' "$temp_file"

# Remove duplicate navigation section if it exists
sed -i '' '/## Navigation/,/workflow_example.md/!b; //!d; /## Navigation/p; /.*workflow_example.md.*/p' "$temp_file"

# Move the fixed content back
cp "$temp_file" "$file"

echo "Markdown formatting has been fixed."
