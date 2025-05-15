#!/bin/bash

# Enhanced script to fix markdown formatting issues in advanced_ai_prompting.md
# Focuses on fixing nested code blocks and list spacing

file="/Users/nisheethranjan/Projects/Graphics/vscode_ai_graphics/advanced_ai_prompting.md"
temp_file="/tmp/advanced_ai_prompting.tmp"

# Make a backup
cp "$file" "$file.bak"

# First, detect and fix nested code blocks
awk '
BEGIN { in_outer_code = 0; in_inner_code = 0; }
/```mermaid/ { 
  if (in_outer_code) {
    in_inner_code = 1;
    # Add a blank line before nested code block if needed
    if (last_line !~ /^$/) { print ""; }
  } else {
    in_outer_code = 1;
  }
  print;
  last_line = $0;
  next;
}
/```typescript/ { 
  if (in_outer_code) {
    in_inner_code = 1;
    # Add a blank line before nested code block if needed
    if (last_line !~ /^$/) { print ""; }
  } else {
    in_outer_code = 1;
  }
  print;
  last_line = $0;
  next;
}
/^```$/ { 
  if (in_inner_code) {
    in_inner_code = 0;
    print;
    print "";  # Add blank line after nested code block
  } else if (in_outer_code) {
    in_outer_code = 0;
    print;
    print "";  # Add blank line after code block
  } else {
    print;
  }
  last_line = $0;
  next;
}
/^\s*```/ {
  if (!in_outer_code && !in_inner_code) {
    # First fix any code blocks without language
    sub(/^\s*```$/, "```plaintext");
    # Add a blank line before code block if needed
    if (last_line !~ /^$/) { print ""; }
    in_outer_code = 1;
  }
  print;
  last_line = $0;
  next;
}
/^[0-9]+\./ {  # Numbered list item
  if (last_line !~ /^$/ && last_line !~ /^[0-9]+\./) { print ""; }
  print;
  last_line = $0;
  next;
}
/^- / {  # Bullet list item
  if (last_line !~ /^$/ && last_line !~ /^- /) { print ""; }
  print;
  last_line = $0;
  next;
}
{
  # If this is not a list item and previous line was, add blank line
  if (last_line ~ /^[0-9]+\./ || last_line ~ /^- /) {
    if ($0 !~ /^[0-9]+\./ && $0 !~ /^- / && $0 !~ /^$/) {
      print "";
    }
  }
  print;
  last_line = $0;
}
' "$file" > "$temp_file"

# Replace the original with the fixed version
cp "$temp_file" "$file"

echo "Enhanced Markdown formatting has been applied."
