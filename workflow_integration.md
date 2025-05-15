# Integrating Diagram Automation into Development Workflows

This guide explains how to integrate the diagram automation capabilities of VS Code 1.100+ with custom instructions and reusable prompts into your development workflows and documentation processes.

## Automating Diagram Updates with Code Changes

### 1. Pre-Commit Hook for Diagram Updates

Create a Git pre-commit hook that:
1. Identifies modified code files
2. Uses VS Code's Copilot Chat to update related diagrams
3. Commits the updated diagrams along with the code changes

**Example Script (place in `.git/hooks/pre-commit`):**

```bash
#!/bin/zsh
# Get list of modified files
modified_files=$(git diff --cached --name-only)

# Check if any architectural components were modified
if echo "$modified_files" | grep -q "src/core/" || echo "$modified_files" | grep -q "architecture/"; then
  echo "Core architecture files modified. Updating architecture diagrams..."
  # Use VS Code CLI to trigger diagram update using a reusable prompt
  # This is conceptual - actual implementation would depend on VS Code CLI capabilities
  code --execute-command "chat.openChat" --args "Update architecture diagrams based on changes to core components"
  
  # Add updated diagram files to the commit
  git add docs/diagrams/*.md
fi
```

### 2. Using GitHub Actions for Diagram Generation

Create a GitHub Action workflow to automatically generate and update diagrams when code changes:

```yaml
# .github/workflows/update-diagrams.yml
name: Update System Diagrams

on:
  push:
    branches: [ main, develop ]
    paths:
      - 'src/core/**'
      - 'architecture/**'
      - 'config/**'

jobs:
  update-diagrams:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Setup VS Code
        uses: actions/setup-vscode@v1
      
      - name: Update Architecture Diagrams
        run: |
          code --execute-command "chat.openChat" --args "Generate updated architecture diagrams based on the current code structure in src/core/"
          
      - name: Commit updated diagrams
        run: |
          git config --local user.email "action@github.com"
          git config --local user.name "GitHub Action"
          git add docs/diagrams/*.md
          git commit -m "Update diagrams based on code changes" || echo "No changes to commit"
          git push
```

## Integrating with Documentation Systems

### 1. Automated Documentation with MkDocs

Set up a workflow that automatically updates diagrams and integrates them with MkDocs:

1. Create a pre-build script for your documentation:

```bash
#!/bin/zsh
# Update diagrams before building documentation
echo "Updating diagrams for documentation..."

# For each system component, use the appropriate diagram generation prompt
components=("user-service" "product-service" "order-service")

for component in "${components[@]}"; do
  code --execute-command "chat.openChat" --args "Generate updated diagram for $component based on current code" > docs/architecture/$component.md
done

# Continue with documentation build
mkdocs build
```

2. Set up VS Code reusable prompts specifically for documentation updates:

```
Generate a class diagram for the component at [file path] in documentation-friendly format.
Include:
- Main classes and interfaces
- Important relationships
- Key methods that define the public API
- Notes explaining complex patterns

Use simplified representation that focuses on the most important elements for documentation purposes.
```

### 2. Integrating with Confluence or SharePoint

Create automation scripts to update diagrams and push them to Confluence or SharePoint:

```bash
#!/bin/zsh
# Generate updated diagrams
code --execute-command "chat.openChat" --args "Generate current architecture diagram in both Mermaid and PNG formats"

# Upload to Confluence using REST API
curl -u $USERNAME:$API_TOKEN -X PUT \
  -H "Content-Type: application/json" \
  --data '{
    "type": "page",
    "title": "System Architecture",
    "space": {"key": "PROJ"},
    "body": {
      "storage": {
        "value": "'"$(cat docs/diagrams/architecture.md)"'",
        "representation": "wiki"
      }
    }
  }' \
  https://your-confluence.atlassian.net/rest/api/content/12345
```

## Diagram-Driven Development

### 1. Setting Up a Diagram-First Workflow

Create VS Code tasks in `.vscode/tasks.json` that support diagram-driven development:

```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Create Component from Diagram",
      "type": "shell",
      "command": "code --execute-command \"chat.openChat\" --args \"Generate a code skeleton from the component diagram at ${file}\"",
      "problemMatcher": []
    },
    {
      "label": "Update Diagram Based on Code Changes",
      "type": "shell",
      "command": "code --execute-command \"chat.openChat\" --args \"Update the diagram at ${relativeFile} based on code changes in ${workspaceFolder}/src/${fileBasenameNoExtension}\"",
      "problemMatcher": []
    },
    {
      "label": "Generate Tests from Diagram",
      "type": "shell",
      "command": "code --execute-command \"chat.openChat\" --args \"Generate unit tests for the component described in the diagram at ${file}\"",
      "problemMatcher": []
    }
  ]
}
```

### 2. Using Diagrams for Code Reviews

Create a reusable prompt for generating diagram-based code review summaries:

```
Create a visual summary of the changes in this PR by:

1. Analyzing the modified files: [list changed files]
2. Generating a before/after architecture diagram showing the impact
3. Highlighting:
   - New components or relationships
   - Modified interfaces
   - Potential impact areas not directly modified
   - Any architectural concerns or improvements

Format the output as a markdown comment that can be posted to a GitHub PR.
```

## Team Collaboration around Diagrams

### 1. Shared Prompt Library in Version Control

Create a team-wide library of reusable prompts stored in version control:

```
project/
├── .vscode/
│   └── prompts/
│       ├── architecture-diagrams.json
│       ├── sequence-diagrams.json
│       ├── class-diagrams.json
│       └── README.md
```

Create a simple script to import these prompts into VS Code:

```bash
#!/bin/zsh
# Import team prompts into VS Code settings
PROMPTS_DIR=".vscode/prompts"
SETTINGS_FILE="$HOME/Library/Application Support/Code/User/settings.json"

# Read each prompt file
for prompt_file in "$PROMPTS_DIR"/*.json; do
  # Merge prompts into settings file
  jq -s '.[0].chat.reusablePrompts += (.[1].prompts)' "$SETTINGS_FILE" "$prompt_file" > temp.json
  mv temp.json "$SETTINGS_FILE"
done

echo "Team prompts imported successfully!"
```

### 2. Diagram Review Workflow

Create standardized reusable prompts for diagram reviews:

```
Review this architecture diagram for:

1. Consistency with our architectural principles:
   - Microservices boundaries properly defined
   - Authentication and authorization correctly applied
   - Appropriate use of caching
   - Proper error handling shown

2. Common issues:
   - Single points of failure
   - Scalability bottlenecks
   - Missing security controls
   - Unclear responsibility boundaries

Provide specific, actionable feedback organized by component.
```

## CI/CD Pipeline Integration

### 1. Diagram Validation in CI/CD

Add a CI step to validate diagrams against code structure:

```yaml
# .github/workflows/validate-diagrams.yml
name: Validate Architecture Diagrams

on:
  pull_request:
    branches: [ main ]
    paths:
      - 'src/**'
      - 'docs/diagrams/**'

jobs:
  validate-diagrams:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Check Diagram Consistency
        run: |
          # This is conceptual - actual implementation would use VS Code CLI
          code --execute-command "chat.openChat" --args "Validate that the diagrams in docs/diagrams/ accurately represent the code structure in src/" > validation-report.md
          
          # Check if report contains inconsistencies
          if grep -q "inconsistency detected" validation-report.md; then
            echo "::error::Diagrams are inconsistent with code structure"
            cat validation-report.md
            exit 1
          fi
```

### 2. Automated Documentation Generation Pipeline

Create a comprehensive documentation generation pipeline that includes diagrams:

```yaml
# .github/workflows/generate-docs.yml
name: Generate Documentation

on:
  push:
    branches: [ main ]
    paths:
      - 'src/**'
      - 'docs/**'

jobs:
  build-docs:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Update Architecture Diagrams
        run: |
          # Generate various diagrams using VS Code commands
          code --execute-command "chat.openChat" --args "Generate system context diagram" > docs/architecture/context.md
          code --execute-command "chat.openChat" --args "Generate component diagram" > docs/architecture/components.md
          code --execute-command "chat.openChat" --args "Generate deployment diagram" > docs/architecture/deployment.md
      
      - name: Build Documentation
        run: |
          # Build documentation with updated diagrams
          mkdocs build
      
      - name: Deploy to GitHub Pages
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./site
```

## Best Practices for Workflow Integration

1. **Version control diagrams as code**: Store diagram code in version control alongside the code they document

2. **Automate routine updates**: Use scripts or CI/CD to keep diagrams in sync with code changes

3. **Create custom prompts for your workflow**: Adapt the reusable prompts to your specific development workflow

4. **Use standard diagram conventions**: Ensure all team members follow the same diagramming standards

5. **Include diagrams in code reviews**: Make diagram updates part of the PR process

6. **Link diagrams to code**: Use references or links that connect diagram components to actual code locations

7. **Create environment-specific views**: Generate different diagram views for different environments

8. **Integrate with existing tools**: Connect diagram automation with your existing documentation and development tools

By integrating diagram automation into your development workflows using VS Code 1.100+'s custom instructions and reusable prompts, you can maintain accurate, up-to-date visual documentation of your system with minimal manual effort.
