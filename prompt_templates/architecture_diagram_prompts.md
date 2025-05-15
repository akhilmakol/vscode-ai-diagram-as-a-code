# System Architecture Diagram Template Prompts

This file contains reusable prompts for creating system architecture diagrams in Mermaid syntax. Copy these prompts and add them to your VS Code Reusable Prompts collection.

## Microservices Architecture

```
Generate a Mermaid flowchart showing a microservices architecture for [system name].
Include these services: [list microservices]. Organize the diagram into these layers:
- Client/Frontend Layer
- API Gateway/BFF Layer
- Service Layer
- Data Layer

Show communication patterns between services, databases for each service, and any
messaging systems. Use subgraphs to organize services by domain or functionality.
```

## Cloud Architecture

```
Create a Mermaid flowchart depicting a cloud architecture for [system name] on
[cloud provider, e.g., AWS, Azure, GCP]. Include these components:
[list key cloud services/components]. Show:
- Compute resources (VMs, containers, serverless)
- Storage services
- Networking components
- Security boundaries
- Integration points with external systems
Use subgraphs to represent different cloud regions, availability zones, or VPCs.
```

## High-Level System Context

```
Generate a Mermaid flowchart showing a high-level system context diagram for
[system name]. Include:
- The system itself as a central component
- All external users (human and system)
- All external systems it integrates with
- Key data flows between components
Keep the diagram simple and focused on external interactions rather than internal details.
```

## Deployment Architecture

```
Create a Mermaid flowchart showing the deployment architecture for [system name].
Include these environments: [e.g., "Development", "Staging", "Production"].
For each environment, show:
- Infrastructure components
- Application components
- Database systems
- Network boundaries
- Load balancers and other infrastructure services
Use subgraphs to separate environments and clearly show deployment topology.
```

## Data Flow Architecture

```
Generate a Mermaid flowchart showing the data flow architecture for [system/process].
Start with data sources, then show:
- Data ingestion components
- Processing/transformation steps
- Storage layers
- Analysis/reporting components
- Data consumers
Use different node shapes for different component types and indicate data volume
or format on the connection arrows where relevant.
```

## Security Architecture

```
Create a Mermaid flowchart depicting the security architecture of [system name].
Include:
- Trust boundaries
- Authentication components
- Authorization enforcement points
- Encryption mechanisms
- Audit logging
- Security monitoring
Use subgraphs to indicate security zones and show how data and requests flow
across security boundaries.
```

## Highly Available Architecture

```
Generate a Mermaid flowchart showing a highly available architecture for [system name].
Include redundant components, load balancers, failover mechanisms, and data replication.
Use subgraphs to show different availability zones or regions. Indicate primary and
backup/standby components and show how they maintain synchronization.
```

## Event-Driven Architecture

```
Create a Mermaid flowchart depicting an event-driven architecture for [system name].
Include:
- Event producers
- Event broker/bus
- Event consumers/processors
- Event storage
- Command/query services
Show the flow of different event types through the system and how they trigger
actions or updates in different components.
```

## Legacy System Integration

```
Generate a Mermaid flowchart showing how [new system] integrates with [legacy system(s)].
Include:
- Integration patterns used (API, ETL, message queue, etc.)
- Adapter/facade components
- Data transformation services
- Synchronization mechanisms
- Error handling for integration failures
Use subgraphs to clearly separate new and legacy components.
```

## DevOps Pipeline Architecture

```
Create a Mermaid flowchart showing the DevOps pipeline architecture for [system name].
Include:
- Code repositories
- Build servers
- Test environments
- Artifact repositories
- Deployment targets
- Monitoring systems
Show the flow from code commit through testing, building, deployment, and operation.
Use subgraphs to organize different pipeline stages.
```
