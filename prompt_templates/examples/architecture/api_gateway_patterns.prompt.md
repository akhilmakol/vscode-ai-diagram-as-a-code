<!--
mode: auto
tools: vscode-markdown, mermaid-preview
-->

# 🔌 API Gateway Integration Patterns Template

Create a comprehensive diagram showing API gateway patterns and integrations.

## Requirements

- Gateway type: [cloud/on-premise/hybrid]
- Integration patterns: [synchronous/asynchronous/hybrid]
- Security requirements: [OAuth/API Key/Custom]
- Scalability needs: [low/medium/high]

## Components

Define the following:
1. Gateway Services
   - Route management
   - Authentication
   - Rate limiting
   - Transformations

2. Backend Services
   - API endpoints
   - Microservices
   - Legacy systems
   - External services

3. Security Layers
   - Authentication
   - Authorization
   - Encryption
   - Threat protection

4. Monitoring & Analytics
   - Usage metrics
   - Performance data
   - Error tracking
   - Business analytics

## Styling Guidelines

- Color code by service type
- Show request flows
- Indicate security checkpoints
- Mark rate limits
- Highlight transformations

## Expected Output

A detailed Mermaid diagram showing the API gateway architecture.

## Example Format

```mermaid
graph TB
    subgraph Clients["Client Layer"]
        direction LR
        MOB[Mobile Apps]
        WEB[Web Apps]
        IOT[IoT Devices]
    end

    subgraph Gateway["API Gateway"]
        direction TB
        subgraph Security["Security Layer"]
            AUTH[Authentication]
            AUTHZ[Authorization]
            WAF[Web App Firewall]
        end
        
        subgraph Core["Core Services"]
            ROUTE[Route Management]
            TRANS[Transformation]
            LIMIT[Rate Limiting]
            CACHE[Response Cache]
        end
        
        subgraph Analytics["Gateway Analytics"]
            METRICS[Usage Metrics]
            LOGS[API Logs]
            TRACE[Request Tracing]
        end
    end

    subgraph Backend["Backend Services"]
        direction TB
        REST[REST APIs]
        GRAPH[GraphQL]
        GRPC[gRPC Services]
        SOAP[Legacy SOAP]
    end

    MOB & WEB & IOT --> WAF
    WAF --> AUTH
    AUTH --> AUTHZ
    AUTHZ --> ROUTE
    ROUTE --> TRANS
    TRANS --> LIMIT
    LIMIT --> CACHE
    
    CACHE --> REST & GRAPH & GRPC & SOAP
    
    ROUTE & TRANS & LIMIT --> METRICS
    METRICS --> LOGS
    LOGS --> TRACE

    classDef client fill:#e3f2fd,stroke:#1565c0
    classDef security fill:#ffcdd2,stroke:#c62828
    classDef core fill:#c8e6c9,stroke:#2e7d32
    classDef analytics fill:#fff3e0,stroke:#ef6c00
    classDef backend fill:#f3e5f5,stroke:#7b1fa2

    class MOB,WEB,IOT client
    class AUTH,AUTHZ,WAF security
    class ROUTE,TRANS,LIMIT,CACHE core
    class METRICS,LOGS,TRACE analytics
    class REST,GRAPH,GRPC,SOAP backend
```

## Additional Context

1. Integration Patterns
   - Request/Response
   - Event-driven
   - Circuit breaking
   - Fallback strategies

2. Performance Optimization
   - Caching strategies
   - Request batching
   - Response compression
   - Connection pooling

3. Security Configuration
   - Authentication methods
   - Authorization rules
   - Rate limit policies
   - IP filtering

4. Monitoring Setup
   - Performance metrics
   - Error tracking
   - Usage analytics
   - Alert configuration

5. Deployment Considerations
   - High availability
   - Load balancing
   - Failover setup
   - Scaling policies
