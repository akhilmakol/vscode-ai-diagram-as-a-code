#!/bin/bash

# Function to enhance flowchart prompts
enhance_flowchart() {
  sed -i '' '1,3s/# Flowchart Diagram Template Prompts/# 📊 Flowchart Diagram Template Prompts\n\n> *A collection of reusable prompts for creating flowchart diagrams in Mermaid syntax*\n\n---/' "$1"
  sed -i '' 's/## Basic Process Flowchart/## 🔄 Basic Process Flowchart/' "$1"
  sed -i '' 's/## System Workflow Flowchart/## 🔄 System Workflow Flowchart/' "$1"
  sed -i '' 's/## Decision Tree Flowchart/## 🔍 Decision Tree Flowchart/' "$1"
  sed -i '' 's/## Application Navigation Flowchart/## 🧭 Application Navigation Flowchart/' "$1"
  sed -i '' 's/## Data Processing Pipeline Flowchart/## 📊 Data Processing Pipeline Flowchart/' "$1"
  sed -i '' 's/## State Transition Flowchart/## 🔄 State Transition Flowchart/' "$1"
  sed -i '' 's/## Customer Journey Flowchart/## 👥 Customer Journey Flowchart/' "$1"
  sed -i '' 's/## Conditional Flowchart/## 🔀 Conditional Flowchart/' "$1"
  sed -i '' 's/## Multi-Layer Process Flowchart/## 📚 Multi-Layer Process Flowchart/' "$1"
  sed -i '' 's/## Error Handling Flowchart/## ⚠️ Error Handling Flowchart/' "$1"
}

# Function to enhance sequence diagram prompts
enhance_sequence() {
  sed -i '' '1,3s/# Sequence Diagram Template Prompts/# 🔄 Sequence Diagram Template Prompts\n\n> *A collection of reusable prompts for creating sequence diagrams in Mermaid syntax*\n\n---/' "$1"
  sed -i '' 's/## Basic Sequence Diagram/## 🔄 Basic Sequence Diagram/' "$1"
  sed -i '' 's/## API Interaction Sequence Diagram/## 🌐 API Interaction Sequence Diagram/' "$1"
  sed -i '' 's/## Authentication Flow Sequence Diagram/## 🔒 Authentication Flow Sequence Diagram/' "$1"
  sed -i '' 's/## Error Handling Sequence Diagram/## ⚠️ Error Handling Sequence Diagram/' "$1"
  sed -i '' 's/## Data Processing Sequence Diagram/## 📊 Data Processing Sequence Diagram/' "$1"
}

# Function to enhance class diagram prompts
enhance_class() {
  sed -i '' '1,3s/# Class Diagram Template Prompts/# 📋 Class Diagram Template Prompts\n\n> *A collection of reusable prompts for creating class diagrams in Mermaid syntax*\n\n---/' "$1"
  sed -i '' 's/## Basic Class Diagram/## 📋 Basic Class Diagram/' "$1"
  sed -i '' 's/## Design Pattern Class Diagram/## 🧩 Design Pattern Class Diagram/' "$1"
  sed -i '' 's/## Inheritance Hierarchy Class Diagram/## 🌲 Inheritance Hierarchy Class Diagram/' "$1"
  sed -i '' 's/## Service Architecture Class Diagram/## 🏗️ Service Architecture Class Diagram/' "$1"
}

# Function to enhance architecture diagram prompts
enhance_architecture() {
  sed -i '' '1,3s/# Architecture Diagram Template Prompts/# 🏗️ Architecture Diagram Template Prompts\n\n> *A collection of reusable prompts for creating architecture diagrams in Mermaid syntax*\n\n---/' "$1"
  sed -i '' 's/## System Context Diagram/## 🌐 System Context Diagram/' "$1"
  sed -i '' 's/## Microservices Architecture Diagram/## 🧩 Microservices Architecture Diagram/' "$1"
  sed -i '' 's/## Multi-Tier Application Architecture Diagram/## 📚 Multi-Tier Application Architecture Diagram/' "$1"
  sed -i '' 's/## Cloud Architecture Diagram/## ☁️ Cloud Architecture Diagram/' "$1"
}

# Function to enhance automation prompts
enhance_automation() {
  sed -i '' '1,3s/# Diagram Automation Template Prompts/# 🤖 Diagram Automation Template Prompts\n\n> *A collection of reusable prompts for automating diagram creation and manipulation*\n\n---/' "$1"
  sed -i '' 's/## Convert Text to Diagram/## 🔄 Convert Text to Diagram/' "$1"
  sed -i '' 's/## Enhance Existing Diagram/## ✨ Enhance Existing Diagram/' "$1"
  sed -i '' 's/## Generate Diagram from Code/## 💻 Generate Diagram from Code/' "$1"
}

# Add navigation sections to all files
add_navigation() {
  if ! grep -q "## Navigation" "$1"; then
    echo -e "\n---\n\n## 🧭 Navigation\n\n- [🏠 Back to Prompt Templates](README.md)\n- [🏠 Back to Main Page](../README.md)" >> "$1"
  fi
}

# Remove HTML comments
remove_comments() {
  sed -i '' '/<!-- filepath:.* -->/d' "$1"
}

# Remove markdown code fences if they appear at the beginning of the file
remove_code_fence_headers() {
  sed -i '' '/^````markdown$/d' "$1"
}

# Process each file
DIR="/Users/nisheethranjan/Projects/Graphics/vscode_ai_graphics/prompt_templates"

# Process flowchart prompts
FILE="$DIR/flowchart_prompts.md"
remove_code_fence_headers "$FILE"
remove_comments "$FILE"
enhance_flowchart "$FILE"
add_navigation "$FILE"

# Process sequence diagram prompts
FILE="$DIR/sequence_diagram_prompts.md"
remove_code_fence_headers "$FILE"
remove_comments "$FILE"
enhance_sequence "$FILE"
add_navigation "$FILE"

# Process class diagram prompts
FILE="$DIR/class_diagram_prompts.md"
remove_code_fence_headers "$FILE"
remove_comments "$FILE"
enhance_class "$FILE"
add_navigation "$FILE"

# Process architecture diagram prompts
FILE="$DIR/architecture_diagram_prompts.md"
remove_code_fence_headers "$FILE"
remove_comments "$FILE"
enhance_architecture "$FILE"
add_navigation "$FILE"

# Process automation prompts
FILE="$DIR/automation_prompts.md"
remove_code_fence_headers "$FILE"
remove_comments "$FILE"
enhance_automation "$FILE"
add_navigation "$FILE"

echo "All prompt template files have been enhanced!"
