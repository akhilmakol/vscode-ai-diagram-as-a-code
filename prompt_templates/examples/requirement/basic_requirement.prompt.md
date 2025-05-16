<!--
mode: auto
tools: vscode-markdown, mermaid-preview
-->

# Basic Requirement Diagram Template

Create a requirement diagram showing system requirements and their relationships with these specifications:

## Requirements

- Scope: [feature/system/project]
- Requirement types: [functional/non-functional]
- Detail level: [high-level/detailed]

## Components

Define the following:
1. Requirements: [list main requirements]
2. Dependencies: [requirement relationships]
3. Risk levels: [specify criticality]
4. Validation criteria: [acceptance tests]

## Styling Guidelines

- Use clear requirement IDs
- Show proper dependency arrows
- Include requirement types
- Group related requirements

## Expected Output

A complete Mermaid requirement diagram showing the requirement hierarchy.

## Example Format

```mermaid
requirementDiagram
    requirement high_level "User Authentication" {
        id: 1
        risk: high
        verifyMethod: test
    }

    requirement auth_req1 "Password Security" {
        id: 1.1
        text: Password must meet complexity requirements
        risk: medium
        verifyMethod: design
    }

    element test_suite "Authentication Tests" {
        type: test
    }

    high_level - satisfies -> auth_req1
    auth_req1 - verifies -> test_suite
```

## Additional Context

Specify any compliance requirements, standards, or validation methods.
