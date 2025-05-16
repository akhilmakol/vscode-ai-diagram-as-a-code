<!--
mode: auto
tools: vscode-markdown, mermaid-preview
-->

# 🌐 Service Mesh Architecture Template

Create a comprehensive diagram showing service mesh architecture and traffic management.

## Requirements

- Mesh type: [sidecar/proxyless]
- Platform: [Kubernetes/VMs/hybrid]
- Features: [traffic management/security/observability]
- Scale: [small/medium/large cluster]

## Components

Define the following:
1. Data Plane
   - Service proxies
   - Sidecar containers
   - Traffic routing
   - Load balancing

2. Control Plane
   - Configuration API
   - Service discovery
   - Certificate management
   - Policy enforcement

3. Observability Stack
   - Metrics collection
   - Distributed tracing
   - Access logging
   - Health monitoring

4. Security Features
   - mTLS setup
   - Authentication
   - Authorization
   - Certificate rotation

## Styling Guidelines

- Color code by plane type
- Show traffic flows
- Indicate security boundaries
- Mark monitoring points
- Highlight control paths

## Expected Output

A detailed Mermaid diagram showing the service mesh architecture.

## Example Format

```mermaid
graph TB
    subgraph Control["Control Plane"]
        direction TB
        API[API Server]
        CONFIG[Config Store]
        CERT[Certificate Authority]
        DISC[Service Discovery]
    end

    subgraph DataPlane["Data Plane"]
        direction TB
        subgraph Service1["Service A Pod"]
            APP1[Application]
            PROXY1[Sidecar Proxy]
        end
        
        subgraph Service2["Service B Pod"]
            APP2[Application]
            PROXY2[Sidecar Proxy]
        end
        
        subgraph Service3["Service C Pod"]
            APP3[Application]
            PROXY3[Sidecar Proxy]
        end
    end

    subgraph Observability["Observability Stack"]
        METRICS[Metrics Store]
        TRACES[Trace Collector]
        LOGS[Log Aggregator]
        DASH[Dashboard]
    end

    %% Control Plane Connections
    API --> CONFIG
    API --> CERT
    API --> DISC
    
    %% Proxy Configuration
    CONFIG --> PROXY1 & PROXY2 & PROXY3
    CERT --> PROXY1 & PROXY2 & PROXY3
    DISC --> PROXY1 & PROXY2 & PROXY3

    %% Service Communication
    APP1 --> PROXY1
    APP2 --> PROXY2
    APP3 --> PROXY3
    
    PROXY1 <--> PROXY2
    PROXY2 <--> PROXY3
    
    %% Observability
    PROXY1 & PROXY2 & PROXY3 --> METRICS
    PROXY1 & PROXY2 & PROXY3 --> TRACES
    PROXY1 & PROXY2 & PROXY3 --> LOGS
    
    METRICS & TRACES & LOGS --> DASH

    classDef control fill:#e3f2fd,stroke:#1565c0
    classDef app fill:#c8e6c9,stroke:#2e7d32
    classDef proxy fill:#fff3e0,stroke:#ef6c00
    classDef obs fill:#f3e5f5,stroke:#7b1fa2

    class API,CONFIG,CERT,DISC control
    class APP1,APP2,APP3 app
    class PROXY1,PROXY2,PROXY3 proxy
    class METRICS,TRACES,LOGS,DASH obs
```

## Additional Context

1. Traffic Management
   - Routing rules
   - Load balancing
   - Circuit breaking
   - Fault injection

2. Security Configuration
   - Identity management
   - Access policies
   - Encryption setup
   - Certificate management

3. Observability Setup
   - Metric collection
   - Trace sampling
   - Log aggregation
   - Dashboard configuration

4. Deployment Considerations
   - Proxy injection
   - Resource requirements
   - High availability
   - Upgrade strategy

5. Performance Impact
   - Latency overhead
   - Resource usage
   - Cache optimization
   - Connection pooling
