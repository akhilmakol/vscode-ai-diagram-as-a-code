<!--
mode: auto
tools: vscode-markdown, mermaid-preview
-->

# 🗃️ Database Schema Evolution Template

Create a comprehensive diagram showing database schema changes and migration strategies.

## Requirements

- Database type: [relational/NoSQL/hybrid]
- Migration scope: [table/schema/database]
- Compatibility: [backward/forward/both]
- Deployment strategy: [rolling/blue-green/canary]

## Components

Define the following:
1. Schema Changes
   - Table modifications
   - Column changes
   - Index updates
   - Constraint changes

2. Migration Steps
   - Pre-migration checks
   - Data transformation
   - Validation steps
   - Rollback procedures

3. Version Management
   - Schema versions
   - Code dependencies
   - API compatibility
   - Client updates

4. Data Handling
   - Data copying
   - Temporary tables
   - Data validation
   - Cleanup procedures

## Styling Guidelines

- Color code by change type
- Show migration sequence
- Indicate validation points
- Mark critical steps
- Highlight rollback paths

## Expected Output

A detailed Mermaid diagram showing the schema evolution process.

## Example Format

```mermaid
graph TB
    subgraph Current["Current Schema v1.0"]
        direction LR
        T1_OLD[(Users v1)]
        T2_OLD[(Orders v1)]
    end

    subgraph Migration["Migration Process"]
        direction TB
        V1[Validate Current Schema]
        B1[Backup Data]
        
        subgraph Changes["Schema Changes"]
            C1[Add Columns]
            C2[Create Indexes]
            C3[Update Constraints]
        end
        
        subgraph Data["Data Migration"]
            D1[Copy Data]
            D2[Transform]
            D3[Verify]
        end
        
        subgraph Validation["Validation Steps"]
            TEST1[Unit Tests]
            TEST2[Integration Tests]
            TEST3[Performance Tests]
        end
    end

    subgraph New["New Schema v2.0"]
        direction LR
        T1_NEW[(Users v2)]
        T2_NEW[(Orders v2)]
    end

    subgraph Rollback["Rollback Plan"]
        R1[Restore Backup]
        R2[Revert Schema]
        R3[Verify State]
    end

    Current --> V1
    V1 --> B1
    B1 --> Changes
    Changes --> Data
    Data --> Validation
    Validation -->|Pass| New
    Validation -->|Fail| Rollback
    
    classDef current fill:#e3f2fd,stroke:#1565c0
    classDef migration fill:#f3e5f5,stroke:#7b1fa2
    classDef new fill:#e8f5e9,stroke:#2e7d32
    classDef rollback fill:#ffcdd2,stroke:#c62828
    classDef validation fill:#fff3e0,stroke:#ef6c00
    
    class T1_OLD,T2_OLD current
    class V1,B1,C1,C2,C3,D1,D2,D3 migration
    class T1_NEW,T2_NEW new
    class R1,R2,R3 rollback
    class TEST1,TEST2,TEST3 validation
```

## Additional Context

1. Migration Planning
   - Impact assessment
   - Downtime requirements
   - Resource needs
   - Timeline planning

2. Testing Strategy
   - Unit testing
   - Integration testing
   - Performance testing
   - Data validation

3. Rollback Planning
   - Trigger conditions
   - Recovery procedures
   - Data preservation
   - Service restoration

4. Communication Plan
   - Stakeholder notification
   - Maintenance windows
   - Progress updates
   - Issue escalation

5. Documentation
   - Schema changes
   - Migration steps
   - Validation criteria
   - Rollback procedures
