<!--
mode: auto
tools: vscode-markdown, mermaid-preview
-->

# 🔄 CI/CD Pipeline Flowchart Template

Create a detailed flowchart showing the continuous integration and deployment pipeline.

## Requirements

- Pipeline type: [basic/advanced/enterprise]
- Environment stages: [dev/staging/prod]
- Automation level: [partial/full]
- Security requirements: [basic/advanced]

## Components

Define the following:
1. Source Control
   - Branch strategies
   - Code review points
2. Build Process
   - Compilation steps
   - Unit tests
   - Code analysis
3. Testing Phases
   - Integration tests
   - Security scans
   - Performance tests
4. Deployment Stages
   - Environment promotions
   - Approval gates
   - Rollback procedures

## Styling Guidelines

- Color code by stage type
- Use distinct shapes for different steps
- Show parallel processes
- Indicate manual checkpoints
- Highlight failure paths

## Expected Output

A complete Mermaid flowchart showing the CI/CD pipeline.

## Example Format

```mermaid
flowchart TD
    subgraph Source["Source Control"]
        A[Developer Push] --> B{Code Review}
        B -->|Rejected| A
        B -->|Approved| C[Merge to Main]
    end

    subgraph Build["Build Phase"]
        C --> D[Compile]
        D --> E[Unit Tests]
        E --> F[Static Analysis]
        
        D & E & F -->|Failure| N[Notify Team]
        N --> A
    end

    subgraph Test["Testing Phase"]
        F -->|Success| G[Integration Tests]
        G --> H[Security Scan]
        H --> I[Performance Tests]
        
        G & H & I -->|Failure| N
    end

    subgraph Deploy["Deployment"]
        I -->|Success| J[Deploy to Dev]
        J --> K{QA Approval}
        K -->|Approved| L[Deploy to Staging]
        L --> M{Production Approval}
        M -->|Approved| O[Deploy to Production]
        
        K & M -->|Rejected| N
    end

    style A fill:#90caf9,stroke:#333
    style B fill:#ffcc80,stroke:#333
    style C fill:#a5d6a7,stroke:#333
    style N fill:#ef9a9a,stroke:#333
    style O fill:#81c784,stroke:#333
```

## Additional Context

- Include monitoring points
- Note required approvals
- Document quality gates
- Specify SLA metrics
- List notification triggers
- Include artifact storage
- Document compliance checks
