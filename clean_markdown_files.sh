#!/bin/zsh

# This script cleans markdown files by removing code fence markers and HTML comments

cleanup_file() {
  local file=$1
  local tmpfile=$(mktemp)
  
  # Read the file line by line, skipping the unwanted lines
  while IFS= read -r line; do
    # Skip markdown fence markers and HTML comments
    if [[ $line != "````markdown" && $line != "```" && $line != *"<!-- filepath:"* ]]; then
      echo "$line" >> "$tmpfile"
    fi
  done < "$file"
  
  # Copy the cleaned content back to the original file
  cat "$tmpfile" > "$file"
  rm "$tmpfile"
  
  echo "✅ Cleaned: $file"
}

# Process all markdown files in the prompt_templates directory
echo "🧹 Cleaning prompt template files..."
for file in /Users/nisheethranjan/Projects/Graphics/vscode_ai_graphics/prompt_templates/*.md; do
  if [[ "$file" != *"_enhanced.md" ]]; then
    cleanup_file "$file"
  fi
done

echo "✨ All files cleaned successfully!"
