<!-- filepath: /Users/nisheethranjan/Projects/Graphics/vscode_ai_graphics/diagram_validation_guide.md -->
# ✅ Diagram Validation Guide

> This guide focuses on tools and techniques for validating diagrams created in VS Code, ensuring they render correctly and follow best practices.

[![Mermaid](https://img.shields.io/badge/Mermaid-8A2BE2?style=for-the-badge&logo=mermaid&logoColor=white)](https://mermaid.js.org/)
[![PlantUML](https://img.shields.io/badge/PlantUML-FBAE00?style=for-the-badge&logo=plantUML&logoColor=black)](https://plantuml.com/)
[![Draw.io](https://img.shields.io/badge/Draw.io-F08705?style=for-the-badge&logo=diagramsdotnet&logoColor=white)](https://www.diagrams.net/)

## 🔍 Why Validate Diagrams?

Diagram validation provides several benefits:

| Benefit | Description |
|---------|-------------|
| 🐛 **Catch Errors** | Identify syntax errors before they reach documentation |
| 🎨 **Ensure Consistency** | Maintain consistent style across all diagrams |
| ✓ **Verify Accuracy** | Confirm diagrams accurately represent systems |
| 👁️ **Improve Readability** | Enhance clarity and usability of diagrams |
| ⏱️ **Save Time** | Reduce troubleshooting of rendering issues |

## 📊 Mermaid Diagram Validation

### 🌐 Online Validators

#### 🔍 Mermaid Live Editor

The [Mermaid Live Editor](https://mermaid.live/) is the most comprehensive validation tool for Mermaid diagrams.

**✨ Features:**

| Feature | Description |
|---------|-------------|
| 🔄 **Real-time Rendering** | Immediate diagram preview with error detection |
| 🎨 **Syntax Highlighting** | Color coding to improve code readability |
| 🌈 **Theme Options** | Preview with multiple visual themes |
| 💾 **Export Options** | Save code and configurations easily |

**📋 How to use:**

1. Copy your Mermaid code (without the markdown code fence markers)
2. Paste into the editor
3. View the diagram and any error messages
4. Make corrections as needed
5. Copy the corrected code back to VS Code

#### 📘 Mermaid.js Interactive Editor

[Mermaid.js Editor](https://mermaid.js.org/docs/syntax/flowchart.html) provides a more basic validation option embedded in the official documentation.

**✨ Features:**

| Feature | Description |
|---------|-------------|
| 🧩 **Simple Interface** | Clean, easy-to-use editing environment |
| 📚 **Documentation Links** | Direct access to relevant documentation |
| ⚠️ **Error Reporting** | Basic error detection and reporting |

### 💻 Command Line Tools

#### ⌨️ Mermaid CLI

The Mermaid command-line interface is excellent for batch validation.

**🔧 Installation:**

```bash
npm install -g @mermaid-js/mermaid-cli
```

**🔍 Basic validation:**

```bash
mmdc -i path/to/your/diagram.mmd -o /tmp/output.svg
```

**🔄 Batch validation script:**

```bash
#!/bin/zsh
# Comprehensive batch validation script for Mermaid diagrams
for file in $(find . -name "*.mmd" -o -name "*.md" | xargs grep -l "```mermaid"); do
    echo "📄 Validating $file..."
    
    if [[ $file == *.md ]]; then
        # Extract Mermaid code blocks from Markdown
        grep -n "```mermaid" "$file" | cut -d':' -f1 | while read -r start; do
            end=$(tail -n +$((start+1)) "$file" | grep -n "```" | head -1 | cut -d':' -f1)
            content=$(tail -n +$((start+1)) "$file" | head -n $((end-1)))
            echo "$content" > /tmp/temp.mmd
            mmdc -i /tmp/temp.mmd -o /tmp/output.svg 2>/tmp/mermaid_error
            
            if [[ $? -ne 0 ]]; then
                echo "❌ Error in $file at line $start:"
                cat /tmp/mermaid_error
            else
                echo "✅ Valid!"
            fi
        done
    else
        # Direct .mmd file validation
        mmdc -i "$file" -o /tmp/output.svg 2>/tmp/mermaid_error
        
        if [[ $? -ne 0 ]]; then
            echo "❌ Error in $file:"
            cat /tmp/mermaid_error
        else
            echo "✅ Valid!"
        fi
    fi
done
```

> 💡 **Pro Tip:** You can save this script as `validate_mermaid.sh` in your project root and run it before committing changes.

### 🧩 VS Code Extension Validation

#### 📄 Markdown Preview

The built-in Markdown Preview provides basic validation:

| Step | Action |
|------|--------|
| 1️⃣ | Open the Markdown file with your diagram |
| 2️⃣ | Press Ctrl+Shift+V (Cmd+Shift+V on Mac) |
| 3️⃣ | If the diagram doesn't render, check for syntax errors |

#### 📊 Mermaid Preview Extension

The Mermaid Preview extension offers more detailed validation:

| Step | Action |
|------|--------|
| 1️⃣ | Open a Markdown file with Mermaid code |
| 2️⃣ | Right-click in the editor and select "Open Preview to the Side" |
| 3️⃣ | Check the preview for any error messages or rendering issues |

#### 🛠️ Custom Workflow with Problems Panel

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

> 💡 **Pro Tip:** Once configured, you can run this task with `Ctrl+Shift+P` > "Tasks: Run Task" > "Validate Mermaid Diagrams"

## 📋 PlantUML Validation

### 🌍 PlantUML Online Validators

#### 📊 PlantUML Web Server

The [PlantUML Web Server](http://www.plantuml.com/plantuml/uml/) provides real-time validation.

**📋 How to use:**

| Step | Action |
|------|--------|
| 1️⃣ | Copy your PlantUML code |
| 2️⃣ | Paste into the editor |
| 3️⃣ | Check for error messages and rendering |

### 💻 Command Line Validation

Install the PlantUML JAR file and validate diagrams:

```bash
java -jar plantuml.jar -checkonly diagram.puml
```

For batch validation:

```bash
#!/bin/zsh
# Batch validation script for PlantUML diagrams
for file in $(find . -name "*.puml"); do
    echo "📄 Validating $file..."
    java -jar plantuml.jar -checkonly "$file"
    
    if [[ $? -ne 0 ]]; then
        echo "❌ Error in $file"
    else
        echo "✅ Valid!"
    fi
done
```

> 💡 **Pro Tip:** Schedule this script to run regularly with cron or as part of your CI pipeline

## 🔄 Draw.io Validation

Draw.io diagrams are generally validated visually, but you can use these checks:

| Check | Description | Command |
|-------|-------------|---------|
| 📋 **XML Validation** | Validate XML structure of .drawio files | `xmllint --noout file.drawio` |
| 🔗 **Broken References** | Check for broken links or references | Open in VS Code with Draw.io extension |

## 🧐 Content Validation

Beyond syntax validation, diagrams should be validated for:

### ✅ Accuracy

| Question | Description |
|----------|-------------|
| 🔄 **Representational Accuracy** | Does the diagram correctly represent the system? |
| 🧩 **Component Accuracy** | Are all components and connections accurately depicted? |
| 📊 **Code Alignment** | Does the diagram match current code or architecture? |

**🔍 Validation technique:** Review diagrams with multiple team members who understand the system.

### 📏 Consistency

| Question | Description |
|----------|-------------|
| 📝 **Terminology** | Do diagrams use consistent terminology? |
| 🎨 **Visual Style** | Are color schemes and styles consistent across diagrams? |
| 🏷️ **Naming** | Are naming conventions followed throughout? |

**🔍 Validation technique:** Create a style guide and checklist for diagram reviews.

### 👁️ Readability

| Question | Description |
|----------|-------------|
| 🔍 **Clarity** | Is the diagram clear and easy to understand? |
| ↔️ **Spacing** | Are elements properly spaced and organized? |
| 📝 **Text** | Is text readable at the default zoom level? |

**🔍 Validation technique:** Have someone unfamiliar with the specific system review the diagram.

### 🧩 Completeness

| Question | Description |
|----------|-------------|
| ✓ **All Elements** | Does the diagram include all necessary elements? |
| 🔗 **Relationships** | Are key relationships shown between components? |
| 📋 **Context** | Is proper context provided for understanding? |

**🔍 Validation technique:** Define required elements for each diagram type.

## 🔄 Pre-Commit Validation

Implement diagram validation as part of your git workflow:

### Step 1: Create a pre-commit hook

Create a `.git/hooks/pre-commit` script:

```bash
#!/bin/zsh
# Validate Mermaid diagrams before commit

echo "🔍 Validating Mermaid diagrams..."

# Get all staged .md files
files=$(git diff --cached --name-only --diff-filter=ACM | grep '\.md$')

for file in $files; do
    # Check if file contains Mermaid diagrams
    if grep -q '```mermaid' "$file"; then
        echo "📄 Checking Mermaid diagrams in $file..."
        
        # Extract and validate Mermaid blocks
        grep -n "```mermaid" "$file" | cut -d':' -f1 | while read -r start; do
            end=$(tail -n +$((start+1)) "$file" | grep -n "```" | head -1 | cut -d':' -f1)
            content=$(tail -n +$((start+1)) "$file" | head -n $((end-1)))
            echo "$content" > /tmp/temp.mmd
            mmdc -i /tmp/temp.mmd -o /tmp/output.svg 2>/tmp/mermaid_error
            
            if [[ $? -ne 0 ]]; then
                echo "❌ Error in $file at line $start:"
                cat /tmp/mermaid_error
                exit 1
            else
                echo "✅ Diagram valid!"
            fi
        done
    fi
done

exit 0
```

### Step 2: Make it executable

Make the hook executable with:

```bash
chmod +x .git/hooks/pre-commit
```

> 💡 **Pro Tip:** You can share this hook with your team by storing it in a `.githooks` directory and configuring Git to use it with `git config core.hooksPath .githooks`

## 🔄 CI/CD Integration

Add diagram validation to your CI/CD pipeline:

### 🚀 GitHub Actions Example

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

> 💡 **Pro Tip:** You can extend this GitHub Action to validate PlantUML diagrams by installing the PlantUML JAR and adding similar validation steps.

### 📊 Pipeline Integration Benefits

| Benefit | Description |
|---------|-------------|
| 🔄 **Automated Validation** | Diagrams are validated automatically with each commit |
| 🚫 **Prevent Bad Merges** | Block PRs with invalid diagrams from being merged |
| 📝 **Documentation** | Generate validation reports for documentation purposes |
| 📊 **Quality Metrics** | Track diagram quality over time |

## 🤖 AI-Assisted Validation

VS Code 1.100+ with GitHub Copilot can help validate and fix diagrams:

### 🔍 Syntax Validation

Use Copilot to identify and fix syntax errors:

| Step | Action |
|------|--------|
| 1️⃣ | Select your diagram code |
| 2️⃣ | Use the command "Ask Copilot" |
| 3️⃣ | Type: "Is this Mermaid diagram code valid? If not, fix the issues:" |

> 💡 **Pro Tip:** You can also ask Copilot to convert between diagram types: "Convert this flowchart to a sequence diagram"

### 🎨 Style Validation

Use custom instructions to validate style consistency:

```text
When reviewing Mermaid diagrams, check for these style issues:
1. Inconsistent node shapes for similar elements
2. Inconsistent relationship line styles
3. Missing or inconsistent labels
4. Poor color contrast or inconsistent color use
5. Overly complex sections that could be simplified
```

### 📊 Accuracy Validation

Prompt Copilot to compare diagrams with code:

```text
"Compare this class diagram with the TypeScript classes in src/models. Are there any discrepancies or missing elements?"
```

| AI Validation Type | Benefits |
|-------------------|----------|
| 🧩 **Structure Analysis** | Validates syntax and structural integrity of diagrams |
| 🔄 **Code Comparison** | Compares diagrams to actual code implementation |
| 📝 **Documentation Alignment** | Ensures diagrams match written documentation |
| 🧠 **Suggestion Generation** | Provides intelligent improvement suggestions |

## 📝 Best Practices for Ongoing Validation

| Best Practice | Description |
|---------------|-------------|
| 🧩 **Create Templates** | Develop pre-validated diagram templates as starting points |
| 📋 **Document Errors** | Maintain a knowledge base of common errors specific to your project |
| 🔄 **Review Integration** | Include diagram validation as part of documentation review process |
| 📏 **Clear Guidelines** | Establish detailed guidelines for each diagram type |
| ⚙️ **Automation** | Implement automated validation in your workflow |
| 🔍 **Regular Audits** | Schedule bulk validation of all documentation diagrams |

> 💡 **Pro Tip:** Create a "diagram validation day" once per quarter where the team reviews and updates all diagrams

### 🏆 Validation Maturity Levels

| Level | Description |
|-------|-------------|
| 1️⃣ **Basic** | Manual validation before publishing |
| 2️⃣ **Standard** | Pre-commit hooks and style guidelines |
| 3️⃣ **Advanced** | CI/CD integration and automated reporting |
| 4️⃣ **Optimized** | AI-assisted validation and continuous improvement |

By implementing a comprehensive validation strategy, you can ensure your diagrams remain accurate, consistent, and error-free, enhancing the overall quality of your documentation.

## 🧭 Navigation

| Document | Description |
|----------|-------------|
| [🏠 Main Page](README.md) | Return to the main documentation hub |
| [❓ Diagram FAQ](diagram_faq.md) | Frequently asked questions about diagramming |
| [🔄 Workflow Integration](workflow_integration.md) | How to integrate diagrams into your workflow |
| [🛠️ Troubleshooting Guide](troubleshooting_guide.md) | Solve common diagram problems |
| [📊 Practical Mermaid Guide](practical_mermaid_guide.md) | Master Mermaid diagram creation |

### 📚 Related Resources

| Resource | Description |
|----------|-------------|
| [Mermaid Documentation](https://mermaid.js.org/intro/) | Official Mermaid.js documentation |
| [PlantUML Documentation](https://plantuml.com/guide) | Official PlantUML documentation |
| [Draw.io Documentation](https://www.drawio.com/doc/) | Official Draw.io documentation |
