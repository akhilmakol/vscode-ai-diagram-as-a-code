# Complete Diagramming Workflow with Custom Instructions and Reusable Prompts

This guide demonstrates a complete workflow for creating professional diagrams using VS Code 1.100+ with custom instructions and reusable prompts.

## Setup: Custom Instructions for Diagram Creation

First, set up custom instructions in VS Code Chat to optimize diagram generation:

1. Open VS Code 1.100+ and access the Chat panel
2. Click the settings icon (⚙️) and select "Custom Instructions"
3. Add these instructions:

```
As a diagram creation assistant for me:

1. When generating diagrams, always use valid Mermaid syntax
2. Follow these styling conventions:
   - Use a consistent color scheme: primary=#5a67d8, secondary=#6b7280, accent=#f0f5ff
   - Apply appropriate shapes for component types (rectangles for processes, diamonds for decisions)
   - Group related elements in subgraphs with clear labels
   - Maintain consistent flow direction (typically left-to-right for flows, top-down for hierarchies)
3. For each diagram:
   - Include descriptive node labels that clearly explain purpose
   - Add comments to explain complex sections
   - Ensure relationships have meaningful labels when needed
   - Format with proper indentation and spacing for readability
4. When modifying diagrams:
   - Preserve existing naming conventions and style
   - Make minimal changes necessary to achieve the goal
   - Explain what was changed so I understand the modifications

Remember that I work with software architecture and design diagrams in an enterprise context, so clarity, consistency and professionalism are essential.
```

## Workflow Example: Creating a System Architecture Diagram

### Step 1: Generate Initial Architecture Using a Reusable Prompt

Create a reusable prompt called "Generate Microservices Architecture":

```
Generate a Mermaid flowchart showing a microservices architecture for our e-commerce platform.
Include these services:
- User Service (authentication, profiles)
- Product Catalog Service (product information, searching)
- Order Service (order processing, history)
- Payment Service (payment processing, refunds)
- Notification Service (email, SMS)

Organize the diagram into these layers:
- Client Layer (web app, mobile app)
- API Gateway Layer
- Service Layer
- Data Layer

Show communication patterns between services, databases for each service, and message queues
for asynchronous communication. Use subgraphs to organize services by domain.
```

### Step 2: Review and Refine the Generated Diagram

After generating the initial diagram, use the Chat to refine it:

"Add a rating and review service to the architecture diagram. It should connect to the product catalog service and have its own database."

The AI will use your custom instructions to maintain consistent styling while adding the requested component.

### Step 3: Add Error Handling Using Another Reusable Prompt

Create a reusable prompt called "Add Error Handling to Diagram":

```
Enhance the following architecture diagram by adding error handling components and flows:

[paste your current diagram here]

Add:
1. Error/failure paths for critical operations
2. Retry mechanisms where appropriate
3. Circuit breakers between services
4. Monitoring/logging components
5. Fallback paths for critical services

Maintain the existing styling and layout while adding these new elements.
```

### Step 4: Export and Document Using Automation Prompts

Create a reusable prompt called "Generate Documentation from Diagram":

```
Generate comprehensive documentation based on this architecture diagram:

[paste your diagram here]

Include:
1. Overview of the architecture
2. Detailed description of each component
3. Explanation of communication patterns
4. Data flow through the system
5. Key design decisions and their rationale
6. Scaling and resilience considerations

Format the documentation in markdown with appropriate headings and structure.
```

## Complete Example: From Requirement to Final Documentation

### Starting Point: Business Requirement

Let's say you have this business requirement:

"We need to design an architecture for our product recommendation system that can analyze user behavior, process product data, and deliver personalized recommendations in real-time."

### Step 1: Initial Diagram Creation

Use your "Generate Architecture Diagram" reusable prompt, customized for this specific requirement:

```
Generate a Mermaid flowchart showing a microservices architecture for our product recommendation system.
Include these components:
- User Behavior Tracker (captures user actions)
- Product Catalog Service (product information)
- Recommendation Engine (generates personalized recommendations)
- Real-time Processing Service (analyzes user behavior in real-time)
- Notification Service (delivers recommendations)

Organize the diagram into these layers:
- Client Layer (web app, mobile app)
- API Gateway Layer
- Service Layer
- Data Processing Layer
- Data Storage Layer

Show data flows between components, storage solutions, and real-time processing mechanisms.
```

### Step 2: Refinement Based on Technical Requirements

After discussing with the team, you need to add specific technologies:

"Update the recommendation system architecture to use Apache Kafka for event streaming, Redis for caching, and a machine learning pipeline for the recommendation engine."

### Step 3: Adding Detail for Implementation

Once the high-level architecture is approved, add implementation details:

"Add more detail to the recommendation engine component, showing the machine learning pipeline stages: data preprocessing, feature extraction, model training, model serving, and feedback collection."

### Step 4: Documentation Generation

Finally, generate documentation for the development team:

"Generate implementation guidelines for the development team based on this architecture diagram. Include component responsibilities, API contracts, data formats, and deployment considerations."

## Benefits of This Workflow

Using VS Code 1.100+'s custom instructions and reusable prompts together provides these benefits:

1. **Consistency**: Your custom instructions ensure all diagrams follow the same styling and conventions
2. **Efficiency**: Reusable prompts save time for common diagram tasks
3. **Flexibility**: You can easily modify existing diagrams or create new ones
4. **Quality**: The combination ensures professional, readable diagrams
5. **Documentation**: Automated documentation keeps diagrams and descriptions in sync
6. **Collaboration**: Text-based diagrams are easier to share and review
7. **Version Control**: Diagrams can be tracked alongside code in your repository

## Best Practices for This Workflow

1. **Start simple, add detail**: Begin with a basic diagram and refine it iteratively
2. **Create prompt templates**: Build a library of reusable prompts for common tasks
3. **Be specific in prompts**: The more detailed your prompts, the better the results
4. **Maintain diagrams**: Update diagrams when the system changes
5. **Combine with manual editing**: For complex diagrams, use AI to create the foundation, then manually refine details
6. **Use version control**: Store diagram code in your repository
7. **Share your prompt library**: Help your team maintain consistent diagrams

## Navigation

- [🏠 Back to Main Page](README.md)
- **Related Documents:**
  - [Custom Instructions Guide](custom_instructions_guide.md)
  - [Advanced AI Prompting](advanced_ai_prompting.md)
  - [Practical Mermaid Guide](practical_mermaid_guide.md)
