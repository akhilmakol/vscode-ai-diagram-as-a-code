<!--
mode: auto
tools: vscode-markdown, mermaid-preview
-->

# 🤖 Machine Learning Pipeline Template

Create a comprehensive diagram showing the ML pipeline from data ingestion to model deployment.

## Requirements

- Pipeline type: [training/inference/both]
- Model type: [classification/regression/deep learning]
- Deployment target: [cloud/edge/hybrid]
- Monitoring needs: [basic/advanced]

## Components

Define the following:
1. Data Flow
   - Data sources
   - Preprocessing steps
   - Feature engineering
   - Data validation

2. Model Pipeline
   - Training process
   - Validation steps
   - Model evaluation
   - Version control

3. Deployment Flow
   - Model serving
   - A/B testing
   - Monitoring
   - Feedback loops

4. Infrastructure
   - Computing resources
   - Storage systems
   - Orchestration tools
   - Monitoring systems

## Styling Guidelines

- Color code pipeline stages
- Show data transformations
- Indicate validation points
- Mark monitoring touchpoints
- Highlight feedback loops

## Expected Output

A detailed Mermaid flowchart showing the complete ML pipeline.

## Example Format

```mermaid
flowchart TB
    subgraph Data_Pipeline["Data Pipeline"]
        direction LR
        D1[(Raw Data)] --> D2[Data Validation]
        D2 --> D3[Preprocessing]
        D3 --> D4[Feature Engineering]
        D4 --> D5[(Feature Store)]
    end

    subgraph Training_Pipeline["Training Pipeline"]
        direction LR
        T1[Model Training] --> T2[Validation]
        T2 --> T3{Metrics Check}
        T3 -->|Pass| T4[Model Registry]
        T3 -->|Fail| T1
        T4 --> T5[Version Control]
    end

    subgraph Deployment_Pipeline["Deployment Pipeline"]
        direction LR
        P1[Model Selection] --> P2[A/B Testing]
        P2 --> P3[Deployment]
        P3 --> P4[Monitoring]
    end

    subgraph Feedback_Loop["Feedback Loop"]
        direction LR
        F1[Performance Metrics] --> F2[Data Drift Check]
        F2 --> F3[Retraining Trigger]
    end

    D5 --> T1
    T5 --> P1
    P4 --> F1
    F3 --> T1

    classDef data fill:#e3f2fd,stroke:#1565c0
    classDef train fill:#f3e5f5,stroke:#7b1fa2
    classDef deploy fill:#e8f5e9,stroke:#2e7d32
    classDef feedback fill:#fff3e0,stroke:#ef6c00

    class D1,D2,D3,D4,D5 data
    class T1,T2,T3,T4,T5 train
    class P1,P2,P3,P4 deploy
    class F1,F2,F3 feedback
```

## Additional Context

1. Data Management
   - Data versioning
   - Data quality metrics
   - Storage requirements
   - Privacy considerations

2. Model Management
   - Model versioning
   - Performance metrics
   - Resource requirements
   - Serving strategies

3. Monitoring Requirements
   - Performance monitoring
   - Data drift detection
   - Resource utilization
   - Alert thresholds

4. Compliance & Governance
   - Model documentation
   - Audit trails
   - Access controls
   - Compliance checks

5. Automation Points
   - CI/CD integration
   - Automated testing
   - Deployment automation
   - Monitoring automation
