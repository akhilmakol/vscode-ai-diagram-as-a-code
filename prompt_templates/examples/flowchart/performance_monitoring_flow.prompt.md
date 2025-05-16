<!--
mode: auto
tools: vscode-markdown, mermaid-preview
-->

# 📊 Performance Monitoring Flow Template

Create a comprehensive diagram showing the flow of performance monitoring data and analysis.

## Requirements

1. Data Collection
   - Metrics sources
   - Log aggregation
   - Tracing points
   - Health checks

2. Processing Pipeline
   - Data ingestion
   - Stream processing
   - Data enrichment
   - Aggregation logic

3. Analysis Systems
   - Metrics analysis
   - Anomaly detection
   - Alert correlation
   - Trend analysis

4. Response Actions
   - Alert routing
   - Automated remediation
   - Escalation paths
   - Feedback loops

## Components

Define the following:

1. Instrumentation
   - Application metrics
   - Infrastructure metrics
   - Network metrics
   - Business metrics

2. Collection & Transport
   - Metric collectors
   - Log shippers
   - Trace agents
   - Event buses

3. Processing & Storage
   - Time-series DB
   - Log analytics
   - Trace storage
   - OLAP systems

4. Analysis & Action
   - Monitoring tools
   - Alerting systems
   - Dashboards
   - Runbooks

## Styling Guidelines

- Group by processing stage
- Show data flow directions
- Indicate processing latency
- Mark critical paths
- Highlight alerting points

## Example Format

```mermaid
graph TB
    subgraph Sources["Data Sources"]
        direction TB
        APP[Application Metrics]
        INF[Infrastructure Metrics]
        NET[Network Metrics]
        BIZ[Business Metrics]
        LOG[System Logs]
        TRC[Distributed Traces]
    end

    subgraph Collection["Data Collection"]
        direction TB
        subgraph Agents["Collection Agents"]
            PROM[Prometheus]
            FLUX[FluentD]
            JAEG[Jaeger Agent]
        end
        
        subgraph Transport["Message Transport"]
            KAFK[Kafka]
            NATS[NATS]
        end
    end

    subgraph Processing["Data Processing"]
        direction TB
        subgraph Storage["Time Series Storage"]
            TSDB[(Time Series DB)]
            ELK[(Elasticsearch)]
            SPAN[(Trace Storage)]
        end
        
        subgraph Analysis["Real-time Analysis"]
            STRM[Stream Processor]
            CORR[Correlation Engine]
            ANOM[Anomaly Detection]
        end
    end

    subgraph Action["Response Actions"]
        direction TB
        ALRT[Alert Manager]
        DASH[Dashboards]
        AUTO[Auto Remediation]
        REPRT[Reports]
    end

    %% Data Collection Flows
    APP & INF --> PROM
    LOG --> FLUX
    TRC --> JAEG
    NET & BIZ --> KAFK
    
    %% Transport Flows
    PROM & FLUX & JAEG --> KAFK
    KAFK --> NATS

    %% Processing Flows
    NATS --> TSDB
    NATS --> ELK
    NATS --> SPAN
    
    TSDB & ELK & SPAN --> STRM
    STRM --> CORR
    CORR --> ANOM

    %% Action Flows
    ANOM --> ALRT
    ALRT --> AUTO
    ALRT --> DASH
    DASH --> REPRT

    classDef source fill:#e3f2fd,stroke:#1565c0
    classDef collect fill:#f3e5f5,stroke:#7b1fa2
    classDef transport fill:#fce4ec,stroke:#c2185b
    classDef storage fill:#e8f5e9,stroke:#2e7d32
    classDef analysis fill:#fff3e0,stroke:#ef6c00
    classDef action fill:#fffde7,stroke:#f9a825

    class APP,INF,NET,BIZ,LOG,TRC source
    class PROM,FLUX,JAEG collect
    class KAFK,NATS transport
    class TSDB,ELK,SPAN storage
    class STRM,CORR,ANOM analysis
    class ALRT,DASH,AUTO,REPRT action
```

## Additional Context

1. Monitoring Strategy
   - Golden signals (latency, traffic, errors, saturation)
   - Custom business metrics
   - SLO/SLI tracking
   - Capacity planning

2. Data Management
   - Retention policies
   - Data aggregation
   - Sampling strategies
   - Storage optimization

3. Analysis Methods
   - Statistical analysis
   - Machine learning
   - Pattern recognition
   - Correlation rules

4. Response Procedures
   - Alert prioritization
   - Runbook automation
   - Escalation policies
   - Incident management

5. Best Practices
   - Monitoring as code
   - Alert tuning
   - Dashboard standardization
   - Metric naming conventions
