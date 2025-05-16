<!--
mode: auto
tools: vscode-markdown, mermaid-preview
-->

# Basic Sankey Diagram Template

Create a Sankey diagram showing flow quantities between nodes with these specifications:

## Requirements

- Flow type: [resource/data/value] flows
- Complexity: [simple/multiple stages]
- Direction: [left-right/top-bottom]

## Components

Define the following:
1. Nodes: [list main nodes]
2. Flows: [describe connections]
3. Quantities: [flow values]
4. Labels: [node and flow descriptions]

## Styling Guidelines

- Use descriptive node names
- Show flow quantities
- Include color coding
- Add proper spacing

## Expected Output

A complete Mermaid Sankey diagram showing the flow distribution.

## Example Format

```mermaid
sankey-beta
    Input [100] --> Process A [40]
    Input [100] --> Process B [30]
    Input [100] --> Process C [30]
    Process A [40] --> Output 1 [25]
    Process A [40] --> Output 2 [15]
    Process B [30] --> Output 2 [30]
    Process C [30] --> Output 1 [15]
    Process C [30] --> Output 2 [15]
```

## Additional Context

Specify any flow constraints, node grouping, or quantity requirements.
