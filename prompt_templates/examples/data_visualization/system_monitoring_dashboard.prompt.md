<!--
mode: auto
tools: vscode-markdown, mermaid-preview
-->

# 📊 System Monitoring Dashboard Template

Create a comprehensive monitoring dashboard showing system health and metrics.

## Requirements

- Monitoring scope: [application/infrastructure/full-stack]
- Update frequency: [real-time/interval-based]
- Alert levels: [info/warning/critical]
- Visualization types: [metrics/logs/traces]

## Components

Define the following:
1. System Metrics
   - Resource utilization
   - Performance metrics
   - Error rates
   - Business KPIs

2. Health Indicators
   - Service status
   - Dependency health
   - SLA compliance
   - Response times

3. Alert Management
   - Threshold definitions
   - Notification rules
   - Escalation paths
   - On-call rotations

4. Trend Analysis
   - Historical data
   - Pattern detection
   - Capacity planning
   - Forecasting

## Styling Guidelines

- Color code by severity
- Group related metrics
- Show threshold lines
- Indicate alert states
- Highlight anomalies

## Expected Output

A detailed Mermaid diagram showing the monitoring dashboard layout.

## Example Format

```mermaid
graph TB
    subgraph Overview["System Overview"]
        direction LR
        H1[Health: 98%]
        U1[Uptime: 99.9%]
        A1[Active Alerts: 2]
    end

    subgraph Resources["Resource Metrics"]
        direction TB
        subgraph Compute["Compute"]
            CPU[CPU: 75%]
            MEM[Memory: 60%]
            DISK[Disk: 45%]
        end
        
        subgraph Network["Network"]
            TPS[Transactions/sec]
            LAT[Latency]
            BW[Bandwidth]
        end
    end

    subgraph Services["Service Health"]
        direction LR
        API[API Gateway]
        DB[Database]
        CACHE[Cache]
        QUEUE[Message Queue]
        
        API --> DB
        API --> CACHE
        API --> QUEUE
    end

    subgraph Alerts["Active Alerts"]
        direction TB
        CRIT[Critical: 0]
        WARN[Warning: 2]
        INFO[Info: 5]
    end

    classDef healthy fill:#c8e6c9,stroke:#2e7d32
    classDef warning fill:#fff3e0,stroke:#ef6c00
    classDef critical fill:#ffcdd2,stroke:#c62828
    classDef metrics fill:#e3f2fd,stroke:#1565c0

    class H1,U1 healthy
    class A1,WARN warning
    class CRIT critical
    class CPU,MEM,DISK,TPS,LAT,BW metrics
```

## Additional Context

1. Metric Collection
   - Data sources
   - Collection intervals
   - Retention policies
   - Aggregation rules

2. Alert Configuration
   - Threshold levels
   - Alert conditions
   - Notification channels
   - Response procedures

3. Dashboard Organization
   - Layout structure
   - Metric grouping
   - Time ranges
   - Refresh rates

4. User Experience
   - Navigation flow
   - Drill-down paths
   - Filter options
   - Export capabilities

5. Integration Points
   - Data sources
   - Alert systems
   - Ticketing systems
   - Communication tools
