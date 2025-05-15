# 📋 Class Diagram Template Prompts

> *A collection of reusable prompts for creating class diagrams in Mermaid syntax*

---

This file contains reusable prompts for creating class diagrams in Mermaid syntax. Copy these prompts and add them to your VS Code Reusable Prompts collection.

## Basic Class Structure

```
Generate a Mermaid class diagram showing the structure of these classes:
[list classes]. For each class, include important attributes and methods.
Show inheritance, composition, and association relationships between classes.
Use proper visibility modifiers (+ for public, - for private, # for protected).
```

## System Architecture Class Diagram

```
Create a Mermaid class diagram representing the architecture of [system name].
Include these main components/classes: [list key components]. Show:
- Interface implementations
- Inheritance hierarchies
- Composition relationships
- Important associations
Use notes to explain key design patterns or architectural decisions.
```

## Domain Model Class Diagram

```
Generate a Mermaid class diagram representing the domain model for [domain name].
Include these core entities: [list entities]. For each entity:
- Include only the most important attributes
- Show relationships between entities with proper cardinality
- Use interface or abstract classes where appropriate
Focus on representing the business domain accurately rather than implementation details.
```

## Design Pattern Implementation

```
Create a Mermaid class diagram showing the implementation of the [pattern name] 
design pattern in the context of [system/component]. Include all classes involved
in the pattern and show how they interact. Use notes to explain how this 
implementation satisfies the pattern's intent and benefits.
```

## Service Layer Class Diagram

```
Generate a Mermaid class diagram showing the service layer of [system name].
Include these services: [list services]. For each service:
- Show its interfaces/contracts
- Key methods with parameters and return types
- Dependencies on other services or repositories
- Use stereotypes <<interface>>, <<service>>, etc. as appropriate
```

## ORM/Database Mapping Class Diagram

```
Create a Mermaid class diagram showing the ORM mapping between classes and
database tables for [system/module name]. Include:
- Entity classes with key attributes
- Relationships between entities
- Mapping annotations/properties (represented as notes if needed)
- Repository/DAO classes that access these entities
Show cardinality for all relationships.
```

## Framework Extension Class Diagram

```
Generate a Mermaid class diagram showing how [system name] extends or customizes
the [framework name] framework. Include:
- Framework base classes/interfaces (simplified)
- Custom implementations and extensions
- Points of integration with the framework
- Custom additions not from the framework
Use notes to explain key extension points.
```

## Component Interaction Class Diagram

```
Create a Mermaid class diagram showing how these components interact:
[list components]. Focus on:
- Interface definitions between components
- Service classes that implement these interfaces
- Key data structures exchanged between components
- Dependency injection or factory relationships
Organize related classes into subgraphs by component.
```

## Event-Driven Architecture Class Diagram

```
Generate a Mermaid class diagram showing the event-driven architecture of
[system name]. Include:
- Event classes/types
- Publishers/producers
- Subscribers/consumers
- Event handlers/processors
- Event bus/broker interfaces
Show relationships between components and the flow of events through the system.
```

## Layered Architecture Class Diagram

```
Create a Mermaid class diagram showing the layered architecture of [system name].
Represent these layers: [e.g., "Presentation", "Business Logic", "Data Access"].
For each layer:
- Show key classes and interfaces
- Dependencies between layers
- How lower layers expose functionality to higher layers
Use subgraphs to visually separate the layers.
```

## Navigation

- [🏠 Back to Main Page](../README.md)
- **Related Documents:**
  - [Prompt Templates Home](README.md)
  - [Class Diagram Example](../class_diagram_example.md)
  - [System Architecture Example](../system_architecture_example.md)
