#!/bin/bash

DIR="/Users/nisheethranjan/Projects/Graphics/vscode_ai_graphics/prompt_templates"

for FILE in "$DIR"/*.md; do
  if [[ "$FILE" != *"_enhanced.md" ]]; then
    # Create a temporary file
    TMP_FILE=$(mktemp)
    
    # Process the file line by line
    started=false
    while IFS= read -r line; do
      if [[ "$line" == "````markdown" ]]; then
        # Skip markdown code fence
        continue
      elif [[ "$line" == "<!-- "* ]]; then
        # Skip HTML comments
        continue
      elif [[ "$started" == false ]]; then
        # First non-comment, non-fence line
        started=true
        echo "$line" >> "$TMP_FILE"
      else
        # Regular line
        echo "$line" >> "$TMP_FILE"
      fi
    done < "$FILE"
    
    # Replace the original file with the processed file
    mv "$TMP_FILE" "$FILE"
    
    echo "Fixed: $FILE"
  fi
done

echo "All prompt template files have been fixed!"
