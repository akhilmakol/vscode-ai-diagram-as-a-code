<!--
mode: auto
tools: vscode-markdown, mermaid-preview
-->

# 🔄 Data Pipeline Architecture Template

Create a comprehensive diagram showing data pipeline architecture and data flows.

## Requirements

- Pipeline type: [batch/streaming/hybrid]
- Data volume: [small/medium/large-scale]
- Processing needs: [real-time/near-real-time/batch]
- Quality requirements: [basic/advanced/regulatory]

## Components

Define the following:
1. Data Sources
   - Source systems
   - Input formats
   - Ingestion methods
   - Source validation

2. Processing Stages
   - Data transformation
   - Enrichment steps
   - Quality checks
   - Business rules

3. Storage Layers
   - Raw storage
   - Processed data
   - Data warehouse
   - Data marts

4. Output Channels
   - Analytics systems
   - Reporting tools
   - API endpoints
   - Export formats

## Styling Guidelines

- Color code by stage type
- Show data flows
- Indicate processing steps
- Mark quality gates
- Highlight critical paths

## Expected Output

A detailed Mermaid diagram showing the data pipeline architecture.

## Example Format

```mermaid
graph LR
    subgraph Sources["Data Sources"]
        direction TB
        S1[(Operational DB)]
        S2[API Feeds]
        S3[File Uploads]
        S4[Stream Events]
    end

    subgraph Ingestion["Data Ingestion"]
        direction TB
        I1[Stream Processing]
        I2[Batch Import]
        I3[Change Capture]
        
        V1{Validation}
    end

    subgraph Processing["Data Processing"]
        direction TB
        subgraph Transform["Transformation"]
            T1[Clean]
            T2[Transform]
            T3[Enrich]
        end
        
        subgraph Quality["Quality Checks"]
            Q1{Format Check}
            Q2{Business Rules}
            Q3{Completeness}
        end
    end

    subgraph Storage["Data Storage"]
        direction TB
        L1[(Raw Layer)]
        L2[(Processed Layer)]
        L3[(Warehouse)]
        L4[(Data Marts)]
    end

    subgraph Consumption["Data Consumption"]
        direction TB
        C1[Analytics]
        C2[Reporting]
        C3[APIs]
        C4[ML Models]
    end

    S1 & S2 --> I2
    S3 --> I2
    S4 --> I1
    S1 --> I3

    I1 & I2 & I3 --> V1
    V1 --> L1
    
    L1 --> T1 --> T2 --> T3
    T3 --> Q1 --> Q2 --> Q3
    
    Q3 --> L2
    L2 --> L3
    L3 --> L4
    
    L3 --> C1 & C2
    L2 --> C3
    L4 --> C4

    classDef source fill:#e3f2fd,stroke:#1565c0
    classDef ingestion fill:#c8e6c9,stroke:#2e7d32
    classDef process fill:#fff3e0,stroke:#ef6c00
    classDef storage fill:#f3e5f5,stroke:#7b1fa2
    classDef consume fill:#ffcdd2,stroke:#c62828
    
    class S1,S2,S3,S4 source
    class I1,I2,I3,V1 ingestion
    class T1,T2,T3,Q1,Q2,Q3 process
    class L1,L2,L3,L4 storage
    class C1,C2,C3,C4 consume
```

## Additional Context

1. Data Management
   - Data governance
   - Metadata management
   - Data catalog
   - Lineage tracking

2. Quality Control
   - Validation rules
   - Error handling
   - Data profiling
   - Quality metrics

3. Performance
   - Scalability design
   - Processing windows
   - Resource allocation
   - Optimization points

4. Operational Aspects
   - Monitoring setup
   - Error recovery
   - SLA management
   - Maintenance windows

5. Security & Compliance
   - Data protection
   - Access control
   - Audit logging
   - Retention policies
