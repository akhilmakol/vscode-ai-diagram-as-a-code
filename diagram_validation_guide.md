# Diagram Validation Guide

This guide focuses on tools and techniques for validating diagrams created in VS Code, ensuring they render correctly and follow best practices.

## Why Validate Diagrams?

Diagram validation provides several benefits:
- Catches syntax errors before they reach documentation
- Ensures consistent style across diagrams
- Verifies that diagrams accurately represent systems
- Improves readability and usability
- Reduces time spent troubleshooting rendering issues

## Mermaid Diagram Validation

### Online Validators

#### 1. Mermaid Live Editor

The [Mermaid Live Editor](https://mermaid.live/) is the most comprehensive validation tool for Mermaid diagrams.

**Features:**
- Real-time rendering and error detection
- Syntax highlighting
- Multiple theme previews
- Code and configuration export options

**How to use:**
1. Copy your Mermaid code (without the markdown code fence markers)
2. Paste into the editor
3. View the diagram and any error messages
4. Make corrections as needed
5. Copy the corrected code back to VS Code

#### 2. Mermaid.js Interactive Editor

[Mermaid.js Editor](https://mermaid.js.org/docs/syntax/flowchart.html) provides a more basic validation option embedded in the official documentation.

**Features:**
- Simple interface
- Direct links to documentation
- Basic error reporting

### Command Line Tools

#### 1. Mermaid CLI

The Mermaid command-line interface is excellent for batch validation.

**Installation:**
```bash
npm install -g @mermaid-js/mermaid-cli
```

**Basic validation:**
```bash
mmdc -i path/to/your/diagram.mmd -o /tmp/output.svg
```

**Batch validation script:**
```bash
#!/bin/zsh
for file in $(find . -name "*.mmd" -o -name "*.md" | xargs grep -l "```mermaid"); do
    echo "Validating $file..."
    
    if [[ $file == *.md ]]; then
        # Extract Mermaid code blocks from Markdown
        grep -n "```mermaid" "$file" | cut -d':' -f1 | while read -r start; do
            end=$(tail -n +$((start+1)) "$file" | grep -n "```" | head -1 | cut -d':' -f1)
            content=$(tail -n +$((start+1)) "$file" | head -n $((end-1)))
            echo "$content" > /tmp/temp.mmd
            mmdc -i /tmp/temp.mmd -o /tmp/output.svg 2>/tmp/mermaid_error
            
            if [[ $? -ne 0 ]]; then
                echo "Error in $file at line $start:"
                cat /tmp/mermaid_error
            fi
        done
    else
        # Direct .mmd file validation
        mmdc -i "$file" -o /tmp/output.svg 2>/tmp/mermaid_error
        
        if [[ $? -ne 0 ]]; then
            echo "Error in $file:"
            cat /tmp/mermaid_error
        fi
    fi
done
```

### VS Code Extension Validation

#### 1. Markdown Preview

The built-in Markdown Preview provides basic validation:

1. Open the Markdown file with your diagram
2. Press Ctrl+Shift+V (Cmd+Shift+V on Mac) 
3. If the diagram doesn't render, check for syntax errors

#### 2. Mermaid Preview Extension

The Mermaid Preview extension offers more detailed validation:

1. Open a Markdown file with Mermaid code
2. Right-click in the editor and select "Open Preview to the Side"
3. Check the preview for any error messages or rendering issues

#### 3. Custom Workflow with Problems Panel

Create a task in `.vscode/tasks.json` to validate Mermaid diagrams:

```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Validate Mermaid Diagrams",
      "type": "shell",
      "command": "find . -name '*.md' | xargs grep -l '```mermaid' | xargs -I{} sh -c 'echo \"Checking {}\"; ./validate_mermaid.sh \"{}\"'",
      "problemMatcher": {
        "owner": "mermaid",
        "fileLocation": ["relative", "${workspaceFolder}"],
        "pattern": {
          "regexp": "^Error in (.+) at line (\\d+):(.*)$",
          "file": 1,
          "line": 2,
          "message": 3
        }
      },
      "presentation": {
        "reveal": "always",
        "panel": "new"
      }
    }
  ]
}
```

## PlantUML Validation

### Online Validators

#### PlantUML Web Server

The [PlantUML Web Server](http://www.plantuml.com/plantuml/uml/) provides real-time validation.

**How to use:**
1. Copy your PlantUML code
2. Paste into the editor
3. Check for error messages and rendering

### Command Line Validation

Install the PlantUML JAR file and validate diagrams:

```bash
java -jar plantuml.jar -checkonly diagram.puml
```

For batch validation:

```bash
#!/bin/zsh
for file in $(find . -name "*.puml"); do
    echo "Validating $file..."
    java -jar plantuml.jar -checkonly "$file"
    
    if [[ $? -ne 0 ]]; then
        echo "Error in $file"
    fi
done
```

## Draw.io Validation

Draw.io diagrams are generally validated visually, but you can use these checks:

1. **XML Validation**: Since .drawio files are XML-based, you can validate the structure:
   ```bash
   xmllint --noout file.drawio
   ```

2. **Broken References**: Open in VS Code with Draw.io extension and check for warnings

## Content Validation

Beyond syntax validation, diagrams should be validated for:

### 1. Accuracy

- Does the diagram correctly represent the system?
- Are all components and connections accurate?
- Does it match current code or architecture?

**Validation technique:** Review diagrams with multiple team members who understand the system.

### 2. Consistency

- Do diagrams use consistent terminology?
- Are color schemes and styles consistent?
- Are naming conventions followed?

**Validation technique:** Create a style guide and checklist for diagram reviews.

### 3. Readability

- Is the diagram clear and easy to understand?
- Are elements properly spaced and organized?
- Is text readable at the default zoom level?

**Validation technique:** Have someone unfamiliar with the specific system review the diagram.

### 4. Completeness

- Does the diagram include all necessary elements?
- Are key relationships shown?
- Is proper context provided?

**Validation technique:** Define required elements for each diagram type.

## Pre-Commit Validation

Implement diagram validation as part of your git workflow:

1. Create a `.git/hooks/pre-commit` script:

```bash
#!/bin/zsh
# Validate Mermaid diagrams before commit

echo "Validating Mermaid diagrams..."

# Get all staged .md files
files=$(git diff --cached --name-only --diff-filter=ACM | grep '\.md$')

for file in $files; do
    # Check if file contains Mermaid diagrams
    if grep -q '```mermaid' "$file"; then
        echo "Checking Mermaid diagrams in $file..."
        
        # Extract and validate Mermaid blocks
        grep -n "```mermaid" "$file" | cut -d':' -f1 | while read -r start; do
            end=$(tail -n +$((start+1)) "$file" | grep -n "```" | head -1 | cut -d':' -f1)
            content=$(tail -n +$((start+1)) "$file" | head -n $((end-1)))
            echo "$content" > /tmp/temp.mmd
            mmdc -i /tmp/temp.mmd -o /tmp/output.svg 2>/tmp/mermaid_error
            
            if [[ $? -ne 0 ]]; then
                echo "Error in $file at line $start:"
                cat /tmp/mermaid_error
                exit 1
            fi
        done
    fi
done

exit 0
```

2. Make it executable:
```bash
chmod +x .git/hooks/pre-commit
```

## CI/CD Integration

Add diagram validation to your CI/CD pipeline:

### GitHub Actions Example

```yaml
name: Validate Diagrams

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main, develop ]

jobs:
  validate:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - name: Set up Node.js
      uses: actions/setup-node@v3
      with:
        node-version: '16'
    
    - name: Install Mermaid CLI
      run: npm install -g @mermaid-js/mermaid-cli
    
    - name: Validate Mermaid diagrams
      run: |
        find . -name "*.md" | xargs grep -l "```mermaid" | while read file; do
          echo "Checking $file"
          grep -n "```mermaid" "$file" | cut -d':' -f1 | while read -r start; do
            end=$(tail -n +$((start+1)) "$file" | grep -n "```" | head -1 | cut -d':' -f1)
            content=$(tail -n +$((start+1)) "$file" | head -n $((end-1)))
            echo "$content" > /tmp/temp.mmd
            mmdc -i /tmp/temp.mmd -o /tmp/output.svg
            if [ $? -ne 0 ]; then
              echo "Error in $file at line $start"
              exit 1
            fi
          done
        done
```

## AI-Assisted Validation

VS Code 1.100+ with GitHub Copilot can help validate and fix diagrams:

### 1. Syntax Validation

Use Copilot to identify and fix syntax errors:

1. Select your diagram code
2. Use the command "Ask Copilot"
3. Type: "Is this Mermaid diagram code valid? If not, fix the issues:"

### 2. Style Validation

Use custom instructions to validate style consistency:

```
When reviewing Mermaid diagrams, check for these style issues:
1. Inconsistent node shapes for similar elements
2. Inconsistent relationship line styles
3. Missing or inconsistent labels
4. Poor color contrast or inconsistent color use
5. Overly complex sections that could be simplified
```

### 3. Accuracy Validation

Prompt Copilot to compare diagrams with code:

"Compare this class diagram with the TypeScript classes in src/models. Are there any discrepancies or missing elements?"

## Best Practices for Ongoing Validation

1. **Create diagram templates** with pre-validated structures
2. **Document common errors** specific to your project
3. **Include validation** in your documentation review process
4. **Establish clear guidelines** for different diagram types
5. **Automate validation** where possible
6. **Regular bulk validation** of all documentation diagrams

By implementing a comprehensive validation strategy, you can ensure your diagrams remain accurate, consistent, and error-free, enhancing the overall quality of your documentation.
