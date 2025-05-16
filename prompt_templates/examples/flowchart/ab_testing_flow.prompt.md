<!--
mode: auto
tools: vscode-markdown, mermaid-preview
-->

# 🔄 A/B Testing Flow Template

Create a comprehensive diagram showing A/B testing workflow and analysis.

## Requirements

- Test scope: [UI/backend/full-stack]
- Target audience: [all users/segment/percentage]
- Metrics: [conversion/engagement/performance]
- Duration: [fixed/dynamic]

## Components

Define the following:
1. Test Setup
   - Hypothesis definition
   - Variant creation
   - Traffic allocation
   - Control group

2. Implementation
   - Feature toggles
   - User segmentation
   - Data collection
   - Analytics setup

3. Monitoring
   - Real-time metrics
   - Statistical analysis
   - Error tracking
   - User feedback

4. Decision Making
   - Success criteria
   - Statistical significance
   - Roll-out strategy
   - Rollback plan

## Styling Guidelines

- Color code by variant
- Show user flows
- Indicate measurement points
- Mark decision gates
- Highlight winning path

## Expected Output

A detailed Mermaid diagram showing the A/B testing process.

## Example Format

```mermaid
graph TB
    subgraph Setup["Test Setup"]
        direction TB
        HYP[Hypothesis]
        VAR[Create Variants]
        CRIT[Define Criteria]
    end

    subgraph Implementation["Test Implementation"]
        direction TB
        subgraph Traffic["Traffic Split"]
            SPLIT{Random Assignment}
            A[Variant A - Control]
            B[Variant B - Test]
        end
        
        subgraph Data["Data Collection"]
            MA[Metrics A]
            MB[Metrics B]
            EVENT[Event Tracking]
        end
    end

    subgraph Analysis["Analysis & Decision"]
        direction TB
        STAT[Statistical Analysis]
        SIG{Significant?}
        WIN{Winner?}
    end

    subgraph Outcome["Test Outcome"]
        direction TB
        ROLL[Rollout Winner]
        STOP[Stop Test]
        EXTEND[Extend Test]
    end

    %% Setup Flow
    HYP --> VAR
    VAR --> CRIT
    CRIT --> SPLIT
    
    %% Implementation Flow
    SPLIT -->|50%| A
    SPLIT -->|50%| B
    
    A --> MA
    B --> MB
    MA & MB --> EVENT
    
    %% Analysis Flow
    EVENT --> STAT
    STAT --> SIG
    SIG -->|Yes| WIN
    SIG -->|No| EXTEND
    
    WIN -->|A Wins| ROLL
    WIN -->|B Wins| ROLL
    WIN -->|Tie| STOP

    classDef setup fill:#e3f2fd,stroke:#1565c0
    classDef implement fill:#c8e6c9,stroke:#2e7d32
    classDef analysis fill:#fff3e0,stroke:#ef6c00
    classDef outcome fill:#f3e5f5,stroke:#7b1fa2

    class HYP,VAR,CRIT setup
    class SPLIT,A,B,MA,MB,EVENT implement
    class STAT,SIG,WIN analysis
    class ROLL,STOP,EXTEND outcome
```

## Additional Context

1. Test Design
   - Hypothesis formulation
   - Sample size calculation
   - Duration estimation
   - Success metrics

2. Implementation Details
   - Feature flags
   - User targeting
   - Data tracking
   - Error handling

3. Analysis Setup
   - Statistical methods
   - Confidence levels
   - Segment analysis
   - Bias detection

4. Decision Framework
   - Success thresholds
   - Rollout criteria
   - Stakeholder communication
   - Documentation needs

5. Best Practices
   - Single variable testing
   - Adequate sample size
   - Test isolation
   - Monitoring plan
