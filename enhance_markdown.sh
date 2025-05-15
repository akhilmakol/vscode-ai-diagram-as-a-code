#!/bin/zsh

# Files to process
FILES=$(find . -name "*.md" -type f -not -path "*/\.*")

# Process each file
for file in $FILES; do
  echo "Processing $file..."

  # Skip README.md as it's already been enhanced
  if [[ "$file" == "./README.md" ]]; then
    echo "Skipping README.md as it's already been enhanced"
    continue
  fi

  # Add emojis to main headers based on content
  if grep -q "Setup\|Configuration\|Install" "$file"; then
    sed -i "" -E "s/^# ([A-Za-z])/# ⚙️ \\1/g" "$file"
  elif grep -q "Implementation\|Guide\|How to" "$file"; then
    sed -i "" -E "s/^# ([A-Za-z])/# 🚀 \\1/g" "$file"
  elif grep -q "Best Practices\|Tips\|Principles" "$file"; then
    sed -i "" -E "s/^# ([A-Za-z])/# 💡 \\1/g" "$file"
  elif grep -q "Example\|Demonstration" "$file"; then
    sed -i "" -E "s/^# ([A-Za-z])/# 📝 \\1/g" "$file"
  elif grep -q "FAQ\|Questions\|Troubleshooting" "$file"; then
    sed -i "" -E "s/^# ([A-Za-z])/# ❓ \\1/g" "$file"
  elif grep -q "Architecture\|System" "$file"; then
    sed -i "" -E "s/^# ([A-Za-z])/# 🏗️ \\1/g" "$file"
  elif grep -q "AI\|Prompting\|Copilot" "$file"; then
    sed -i "" -E "s/^# ([A-Za-z])/# 🤖 \\1/g" "$file"
  elif grep -q "Class\|UML" "$file"; then
    sed -i "" -E "s/^# ([A-Za-z])/# 🧩 \\1/g" "$file"
  elif grep -q "Sequence\|Flow\|Workflow" "$file"; then
    sed -i "" -E "s/^# ([A-Za-z])/# ⏱️ \\1/g" "$file"
  else
    sed -i "" -E "s/^# ([A-Za-z])/# 📊 \\1/g" "$file"
  fi
  
  # Add emojis to second-level headers based on content
  sed -i "" -E "s/^## Prerequisites/## 🔧 Prerequisites/g" "$file"
  sed -i "" -E "s/^## Getting Started/## 🚀 Getting Started/g" "$file"
  sed -i "" -E "s/^## Installation/## 📥 Installation/g" "$file"
  sed -i "" -E "s/^## Configuration/## ⚙️ Configuration/g" "$file"
  sed -i "" -E "s/^## Extensions/## 🧩 Extensions/g" "$file"
  sed -i "" -E "s/^## Benefits/## ✨ Benefits/g" "$file"
  sed -i "" -E "s/^## Example/## 📝 Example/g" "$file"
  sed -i "" -E "s/^## Troubleshooting/## 🔧 Troubleshooting/g" "$file"
  sed -i "" -E "s/^## References/## 📚 References/g" "$file"
  sed -i "" -E "s/^## Navigation/## 🧭 Navigation/g" "$file"
  
  # For any remaining second-level headers
  sed -i "" -E "s/^## ([0-9]+\. )?([A-Za-z])/## 📌 \\2/g" "$file"
  
  # Check and standardize the Navigation section at the end
  if ! grep -q "## Navigation" "$file"; then
    # If file doesn't have a navigation section, add one
    echo -e "\n\n## 🧭 Navigation\n\n- [🏠 Back to Main Page](README.md)" >> "$file"
  fi
  
  echo "Completed processing $file"
done

echo "All files have been processed!"
