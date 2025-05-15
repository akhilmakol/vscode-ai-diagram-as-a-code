# Industry-Specific Diagram Use Cases with Custom Instructions and Prompts

This guide explores how the combination of VS Code 1.100+'s custom instructions and reusable prompts can be applied to create specialized diagrams for different industries and domains.

## 1. Software Architecture and Development

### Custom Instruction for Software Architecture

```
As a software architecture diagram specialist:
1. Follow C4 model conventions when appropriate (Context, Container, Component, Code)
2. Use standard shapes for architectural components (cylinders for databases, rectangles for services)
3. Include these essential elements in all architecture diagrams:
   - Component boundaries and interfaces
   - Data flow directions
   - Synchronous vs. asynchronous communication
   - Security boundaries
   - Scalability considerations
4. For microservices architectures, emphasize:
   - Service boundaries and responsibilities
   - Communication patterns (request/response, event-based)
   - Data ownership
```

### Example Use Case: API Gateway Design

**Reusable Prompt:**
```
Create a detailed architecture diagram for an API Gateway implementation with:
- External client types (web, mobile, third-party)
- Authentication/authorization mechanisms
- Rate limiting and throttling
- Request routing logic
- Service discovery integration
- Monitoring and logging
- Caching capabilities
- Circuit breaking for downstream service failures

Show the complete request flow from clients through the gateway to backend services.
```

## 2. DevOps and Infrastructure

### Custom Instruction for Infrastructure Diagrams

```
When creating infrastructure and deployment diagrams:
1. Follow cloud provider iconography standards when applicable
2. Clearly delineate network boundaries and security groups
3. Show scaling mechanisms and high-availability configurations
4. Include monitoring, logging, and alerting components
5. Represent CI/CD pipeline components and workflows
6. For multi-environment setups, use consistent color coding:
   - Development: #E1F5FE
   - Staging: #FFF8E1
   - Production: #FFEBEE
```

### Example Use Case: Kubernetes Deployment

**Reusable Prompt:**
```
Generate a Mermaid diagram showing our Kubernetes deployment architecture with:
- Cluster organization (namespaces, node pools)
- Pod deployment strategy with replica sets
- Service mesh implementation
- Ingress controllers and configurations
- Persistent storage solutions
- ConfigMaps and Secrets management
- Horizontal and vertical scaling mechanisms
- Monitoring stack integration (Prometheus, Grafana)

Show both control plane and data plane components with clear separation of concerns.
```

## 3. Data Engineering and Analytics

### Custom Instruction for Data Flow Diagrams

```
As a data flow and analytics architecture specialist:
1. Represent data sources with appropriate icons (databases, APIs, streams)
2. Show data transformations and enrichment steps clearly
3. Indicate data volumes where relevant (GB/day, events/second)
4. Use color coding for:
   - Raw data: #D1C4E9
   - Processed data: #BBDEFB
   - Analytical results: #C8E6C9
5. Include data governance and quality control points
6. For ML pipelines, clearly separate:
   - Data preparation
   - Feature engineering
   - Model training
   - Model deployment
   - Inference
```

### Example Use Case: Real-time Analytics Pipeline

**Reusable Prompt:**
```
Create a detailed data flow diagram for our real-time analytics pipeline with:
- Data sources (clickstream, transaction system, user profiles)
- Ingestion layer (Kafka topics with partitioning)
- Stream processing components (Flink jobs)
- Feature store integration
- Real-time scoring with deployed ML models
- Results storage (hot and cold paths)
- Visualization and dashboard systems
- Feedback loops for model retraining

Include expected data volumes and latency requirements at each stage.
```

## 4. Healthcare Systems

### Custom Instruction for Healthcare Diagrams

```
When creating healthcare systems diagrams:
1. Emphasize HIPAA compliance and data protection measures
2. Use clear boundaries between PHI and non-PHI data flows
3. Include audit logging for all sensitive data access
4. Show integration points with standard healthcare systems:
   - EHR/EMR systems
   - PACS for imaging
   - Laboratory information systems
   - Pharmacy systems
5. Use standard healthcare interoperability protocols:
   - HL7 FHIR
   - DICOM
   - X12
6. Include patient consent and data sharing controls
```

### Example Use Case: Telehealth Platform

**Reusable Prompt:**
```
Generate an architecture diagram for our telehealth platform showing:
- Patient mobile/web application
- Provider portal
- Video consultation service
- Medical record integration
- E-prescription capability
- Appointment scheduling system
- Billing and insurance verification
- Analytics for population health

Highlight all PHI data flows and ensure security/compliance controls are clearly indicated.
```

## 5. Financial Systems

### Custom Instruction for Financial System Diagrams

```
As a financial systems architecture specialist:
1. Emphasize security, compliance, and audit capabilities
2. Clearly indicate transaction boundaries and ACID properties
3. Include reconciliation and verification points
4. Show regulatory reporting components
5. Use clear symbols for:
   - Payment processors
   - Ledger systems
   - Risk assessment components
   - Fraud detection mechanisms
6. Indicate latency requirements for critical paths
7. Show disaster recovery and business continuity elements
```

### Example Use Case: Payment Processing System

**Reusable Prompt:**
```
Create a detailed system diagram for our payment processing architecture with:
- Multiple payment method integrations (credit card, ACH, wire transfer)
- Authorization and capture flows
- Fraud detection system integration
- Treasury management interface
- Fee calculation engine
- Reconciliation processes
- Settlement workflows
- Chargeback handling
- Regulatory reporting

Ensure compliance components and audit logging are clearly indicated.
```

## 6. E-Commerce Systems

### Custom Instruction for E-Commerce Diagrams

```
When creating e-commerce system diagrams:
1. Separate customer-facing and back-office components
2. Show scalability patterns for handling traffic spikes
3. Include inventory management and fulfillment systems
4. Highlight:
   - Product catalog services
   - Checkout processes
   - Payment gateways
   - Order processing workflows
   - Customer account management
5. Show personalization and recommendation engines
6. Include integration with marketing and analytics systems
```

### Example Use Case: Product Catalog and Search

**Reusable Prompt:**
```
Generate a detailed architecture diagram for our product catalog and search system with:
- Product information management
- Catalog indexing pipeline
- Search service with faceting and filters
- Caching strategy for performance
- Inventory availability integration
- Price and promotion engine
- Image and media management
- Analytics for search quality

Show how data flows from product creation to appearance in search results, including all caching and update mechanisms.
```

## 7. IoT Systems

### Custom Instruction for IoT Diagrams

```
As an IoT architecture specialist:
1. Clearly separate edge, fog, and cloud components
2. Include device management and provisioning systems
3. Show telemetry data flows and command paths
4. Emphasize security at all levels:
   - Device security
   - Communication security
   - Cloud security
5. Include data storage strategies for time-series data
6. Show analytics and ML components
7. Indicate offline operation capabilities
```

### Example Use Case: Smart Building Management

**Reusable Prompt:**
```
Create an IoT architecture diagram for our smart building management system with:
- Sensor networks (temperature, occupancy, energy usage)
- Edge gateways for local processing
- Device management and provisioning
- Real-time monitoring dashboard
- Energy optimization algorithms
- Predictive maintenance capabilities
- Integration with building automation systems
- Historical analytics for facility management

Show both real-time control flows and historical data analysis paths.
```

## Tips for Industry-Specific Diagrams

1. **Know your audience**: Technical depth should match the intended audience
2. **Use domain terminology**: Include industry-specific terms familiar to users
3. **Follow industry standards**: Use recognized patterns and iconography when available
4. **Include compliance elements**: Show regulatory and compliance components relevant to the industry
5. **Highlight key concerns**: Emphasize aspects most important to the specific domain (security for healthcare, performance for financial systems, etc.)
6. **Create custom prompt libraries**: Develop and share prompt libraries for your specific industry
7. **Document domain assumptions**: Include notes explaining domain-specific concepts or requirements

## Setting Up Industry-Specific Custom Instructions

When setting up custom instructions for your industry:

1. **Include standard conventions**: Reference industry-standard modeling conventions
2. **Specify terminology preferences**: Note industry-specific terms to use consistently
3. **Define symbol meanings**: Create a standard symbol set for your domain
4. **Include compliance requirements**: Note regulatory considerations that should always be included
5. **Set quality standards**: Define what makes a diagram useful in your specific domain

By combining domain-specific custom instructions with targeted reusable prompts, you can quickly generate diagrams that follow industry best practices and effectively communicate complex systems to domain experts.
