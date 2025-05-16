<!--
mode: auto
tools: vscode-markdown, mermaid-preview
-->

# 🔄 Decision Tree Flowchart Template

Create a decision tree flowchart for complex decision-making processes.

## Requirements

- Decision type: [business/technical/operational]
- Complexity: [2-3 levels/4+ levels]
- Outcome types: [binary/multiple]
- Branch conditions: [specify criteria]

## Components

Define the following:
1. Initial question/condition
2. Decision nodes with criteria
3. Branch paths
4. Terminal outcomes
5. Probability values (optional)

## Styling Guidelines

- Use diamond shapes for decisions
- Rectangle shapes for outcomes
- Color code by decision type
- Include probability percentages
- Add descriptive edge labels

## Expected Output

A complete Mermaid decision tree showing the decision-making process.

## Example Format

```mermaid
flowchart TD
    A{Customer Request} -->|New User| B{Account Type}
    A -->|Existing User| C{Service Type}
    
    B -->|Personal| D[Create Basic Account]
    B -->|Business| E[Create Business Account]
    B -->|Enterprise| F[Contact Sales Team]
    
    C -->|Support| G{Priority Level}
    C -->|Sales| H[Route to Sales Team]
    C -->|Billing| I[Route to Billing]
    
    G -->|High| J[Immediate Response]
    G -->|Medium| K[24hr Response]
    G -->|Low| L[48hr Response]
    
    style A fill:#f9f,stroke:#333
    style B fill:#bbf,stroke:#333
    style C fill:#bbf,stroke:#333
    style G fill:#bbf,stroke:#333
```

## Additional Context

- Include success/failure probabilities
- Add time estimates for each path
- Note resource requirements
- Highlight critical decision points
