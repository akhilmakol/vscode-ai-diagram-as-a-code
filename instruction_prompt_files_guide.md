# 📝 Using VS Code 1.100+ Markdown-Based Instruction and Prompt Files

> This guide explains how to leverage VS Code 1.100+'s Markdown-based instruction and prompt files to enhance diagram creation and maintenance across your workflows.

[![VS Code](https://img.shields.io/badge/VS_Code-1.100+-007ACC?style=for-the-badge&logo=visual-studio-code&logoColor=white)](https://code.visualstudio.com/)
[![GitHub Copilot](https://img.shields.io/badge/GitHub_Copilot-enabled-2EA44F?style=for-the-badge&logo=github&logoColor=white)](https://github.com/features/copilot)
[![Mermaid](https://img.shields.io/badge/Mermaid-8A2BE2?style=for-the-badge&logo=mermaid&logoColor=white)](https://mermaid.js.org/)

## 📑 Table of Contents

| Section | Description |
|---------|-------------|
| [💡 Understanding Markdown-based Files](#-understanding-markdown-based-files) | Overview of instruction and prompt files in VS Code 1.100+ |
| [📋 Creating Instruction Files](#-creating-instruction-files) | How to create and use `.instructions.md` files |
| [🔄 Creating Prompt Files](#-creating-prompt-files) | How to create and use `.prompt.md` files |
| [🧩 Advanced Configuration](#-advanced-configuration) | Additional options and parameters |
| [🛠️ Integration with Workflows](#%EF%B8%8F-integration-with-workflows) | Using these files in your development processes |
| [✅ Best Practices](#-best-practices) | Guidelines for effective implementation |

## 💡 Understanding Markdown-based Files

VS Code 1.100+ introduces two new Markdown-based file types that significantly enhance AI integration:

### 📄 Instruction Files (`.instructions.md`)

**Purpose**: Define common guidelines, context, and preferences for AI that can be applied automatically to specified files or manually attached to chat requests.

**Benefits**:
- Ensure consistent diagram styling across teams
- Standardize code and diagram conventions
- Provide project-specific context without repetition
- Create specialized assistants for different diagram types

### 📄 Prompt Files (`.prompt.md`)

**Purpose**: Create reusable, standalone chat requests that can be executed on demand, complete with mode specifications and tool requirements.

**Benefits**:
- Automate common diagram creation tasks
- Ensure consistent prompt quality across teams
- Create standardized diagram generation templates
- Support various chat modes (ask, edit, agent)

## 📋 Creating Instruction Files

### 📁 File Structure

Create a file with the `.instructions.md` extension:

```
project/
├── architecture/
│   ├── diagrams.instructions.md      # Instructions for all diagram files
│   ├── component-diagrams/
│   ├── sequence-diagrams/
├── docs/
│   └── documentation.instructions.md # Instructions for documentation files
├── global.instructions.md            # Global project instructions
```

### 📝 Basic Template

```markdown
# Diagram Creation Instructions

This file contains instructions for creating and updating diagrams in this project.

## Context
- This project uses a microservices architecture
- Our system has 8 core services connected via message queues
- We follow C4 model conventions for architecture documentation

## Style Guide
- Use consistent color palette: primary (#5a67d8), secondary (#c3dafe)
- All diagrams must include a title and description
- Group related components using subgraphs
- Maintain left-to-right flow for readability

## Required Components
- Authentication Service
- User Service
- Product Catalog
- Order Processing
- Payment Gateway
- Notification Service
- Analytics
- Admin Dashboard
```

### 🔄 Apply Instructions to Files

You can apply instructions:

1. **Automatically**: Set up a file glob pattern to match specific file types
2. **Manually**: Attach instructions to a chat session as needed

#### 🛠️ Configuration in `settings.json`:

```json
{
  "chat.instructionFilesPattern": {
    "**/*.mmd": ["**/diagrams.instructions.md"],
    "**/*.md": ["**/documentation.instructions.md"],
    "**/architecture/**": ["**/architecture/diagrams.instructions.md"]
  }
}
```

#### ⚙️ Manual Attachment:

1. Open the Chat view
2. Click on the "Attach" button
3. Select "Instruction File"
4. Choose your `.instructions.md` file

## 🔄 Creating Prompt Files

### 📁 File Structure

Create a file with the `.prompt.md` extension:

```
project/
├── prompts/
│   ├── generate-component-diagram.prompt.md
│   ├── update-sequence-diagram.prompt.md
│   ├── create-entity-diagram.prompt.md
│   └── review-architecture.prompt.md
```

### 📝 Basic Template

```markdown
---
mode: agent
tools:
  - file_search
  - read_file
  - semantic_search
  - mermaid-diagram-validator
  - mermaid-diagram-preview
---

# Generate Component Diagram

Create a comprehensive component diagram for our system that shows:

1. All microservices from the `src/services` directory
2. Their relationships and communication patterns
3. External dependencies and data stores

## Requirements:

- Use Mermaid flowchart syntax with LR orientation
- Group services by domain functionality
- Show both synchronous and asynchronous communication patterns
- Use consistent styling based on our style guide
- Include detailed component descriptions
```

### 🚀 Running Prompt Files

Execute prompt files directly:

1. **Command Palette**: Use "Chat: Run Prompt File"
2. **Explorer Context Menu**: Right-click on a `.prompt.md` file
3. **Terminal**: `code --chat "run-prompt-file path/to/file.prompt.md"`

### 📌 Prompt File Parameters

You can specify various parameters in the YAML frontmatter:

```yaml
---
mode: agent             # Options: ask, edit, agent
tools:                  # List of required tools
  - file_search
  - read_file
  - semantic_search
variables:              # Define custom variables
  service: "users"
  diagram_type: "component"  
---
```

## 🧩 Advanced Configuration

### 🔤 Variable Substitution

Prompt files support variable substitution:

```markdown
---
variables:
  component: "auth-service"
  style: "detailed"
---

# Generate {{style}} diagram for {{component}}

This prompt will create a {{style}} diagram showing the internal structure of the {{component}}.
```

When running the prompt, VS Code will ask for values for these variables or use the defaults.

### 📂 Shared Instruction Libraries

Place common instruction files in shared locations:

1. **User Data Folder**: `~/.vscode/instructions/`
2. **Workspace Folder**: `.vscode/instructions/`

### 🔄 Combining Instructions and Prompts

Use the `instructions` parameter in a prompt file to reference instruction files:

```yaml
---
mode: agent
instructions:
  - "global.instructions.md"
  - "diagrams.instructions.md"
---
```

## 🛠️ Integration with Workflows

### 🔄 Git Hooks

Create a pre-commit hook that uses prompt files for diagram updates:

```bash
#!/bin/zsh
# Get list of modified files
modified_files=$(git diff --cached --name-only)

# Check if any architectural components were modified
if echo "$modified_files" | grep -q "src/core/"; then
  echo "Core architecture files modified. Updating architecture diagrams..."
  # Use prompt file to update diagrams
  code --chat "run-prompt-file .vscode/prompts/update-architecture-diagram.prompt.md" --args "component=core"
  
  # Add updated diagram files to the commit
  git add docs/diagrams/*.md
fi
```

### 🚀 CI/CD Integration

Update your CI/CD pipeline to use prompt files:

```yaml
# .github/workflows/update-diagrams.yml
name: Update System Diagrams

on:
  push:
    branches: [ main, develop ]
    paths:
      - 'src/core/**'

jobs:
  update-diagrams:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Setup VS Code
        uses: actions/setup-vscode@v1
      
      - name: Update Architecture Diagrams
        run: |
          code --chat "run-prompt-file .vscode/prompts/update-architecture-diagram.prompt.md" --args "component=system"
          
      - name: Commit updated diagrams
        run: |
          git config --local user.email "action@github.com"
          git config --local user.name "GitHub Action"
          git add docs/diagrams/*.md
          git commit -m "Update diagrams based on code changes" || echo "No changes to commit"
          git push
```

### 🤝 Team Collaboration

Share standardized files across your team:

```text
project/
├── .vscode/
│   ├── instructions/
│   │   ├── common-style.instructions.md
│   │   ├── frontend-components.instructions.md
│   │   └── backend-services.instructions.md
│   ├── prompts/
│   │   ├── generate-component-diagram.prompt.md
│   │   ├── update-sequence-diagram.prompt.md
│   │   └── create-entity-diagram.prompt.md
```

### 📊 Documentation Integration

Integrate prompt files into your documentation workflow:

```bash
#!/bin/zsh
# Update diagrams before building documentation
echo "Updating diagrams for documentation..."

# Use specific prompt files for each component
components=("user-service" "product-service" "order-service")

for component in "${components[@]}"; do
  code --chat "run-prompt-file .vscode/prompts/generate-component-doc.prompt.md" --args "component=$component" > docs/architecture/$component.md
done

# Continue with documentation build
mkdocs build
```

## ✅ Best Practices

| # | Best Practice | Description |
|---|---------------|-------------|
| 1 | 📋 **Version control instruction and prompt files** | Store these files in your repository to track changes |
| 2 | 📄 **Be specific in instructions** | Provide clear style guides and conventions in instruction files |
| 3 | 🧩 **Create modular instruction files** | Break down into domain-specific files that can be combined |
| 4 | 🔄 **Build a prompt file library** | Create standardized prompts for common diagram tasks |
| 5 | 📁 **Organize with consistent naming** | Use clear naming conventions like `component-diagram.prompt.md` |
| 6 | 🔗 **Link instructions to file patterns** | Configure automatic application of instructions to file types |
| 7 | 📝 **Document variable usage** | Include comments in prompt files explaining available variables |
| 8 | 👁️ **Review and refine regularly** | Update your files based on team feedback and evolving needs |

## 🔎 Key Takeaways

1. **Instructions are reusable context** - Define once, apply consistently across files
2. **Prompts are executable tasks** - Create standardized diagram generation procedures
3. **Files can be version controlled** - Store alongside code for consistent evolution
4. **Build a shared library** - Create organization-wide standards for diagrams
5. **Automate where possible** - Integrate with CI/CD and workflows

## 🚀 Getting Started

1. Create a simple `.instructions.md` file with your diagram style guide
2. Build a `.prompt.md` file for a common diagram generation task
3. Configure VS Code to automatically apply instructions to diagram files
4. Add these files to version control
5. Share with your team to establish consistent practices

## 🧭 Navigation

- [🏠 Back to Main Page](README.md)
- **Related Documents:**
  - [Workflow Integration](workflow_integration.md)
  - [Custom Instructions Guide](custom_instructions_guide.md)
  - [Prompt Templates](prompt_templates/)
  - [VS Code Setup Guide](vscode_setup_guide.md)
