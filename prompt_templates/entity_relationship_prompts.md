# 📊 Entity-Relationship Diagram Template Prompts

> *A collection of reusable prompts for creating entity-relationship diagrams in Mermaid syntax*

---

This file contains reusable prompts for creating entity-relationship diagrams in Mermaid syntax. Copy these prompts and add them to your VS Code Reusable Prompts collection.

## Basic Database Schema ERD

```
Generate a Mermaid entity-relationship diagram for a [system name] database.
Include these entities: [list entities].
For each entity, include important attributes and specify primary keys.
Show relationships between entities with proper cardinality (one-to-one,
one-to-many, many-to-many). Use the official Mermaid ERD syntax.
```

## E-Commerce System ERD

```
Create a Mermaid entity-relationship diagram for an e-commerce database.
Include these core entities: Customer, Product, Order, OrderItem, Category, Payment.
Add essential attributes for each entity (e.g., id, name, price, date).
Show all relationships with proper cardinality notation.
Include foreign key relationships where applicable.
```

## Content Management System ERD

```
Generate a Mermaid entity-relationship diagram for a CMS database with these entities:
User, Role, Permission, Content, Category, Tag, Comment.
Include attributes for each entity and specify data types.
Show all relationships with proper cardinality notation.
Highlight primary and foreign keys.
Add notes explaining any complex relationships or constraints.
```

## Normalized Schema ERD

```
Create a Mermaid entity-relationship diagram showing a normalized database schema
for [system name]. Start with the base entities and show how normalization
creates additional tables to eliminate redundancies. Include these entities:
[list base entities]. Show all normalization steps to at least 3NF (Third Normal Form).
Add notes explaining the normalization decisions.
```

## Legacy Database Mapping ERD

```
Generate a Mermaid entity-relationship diagram that maps a legacy database
structure to a new, modernized schema. Show both the old and new entities
side-by-side, using different colors or styling to distinguish them.
Include transformation notes explaining how data migrates from old to new.
Focus on these key entities: [list entities].
```

## Microservice Database ERD

```
Create a Mermaid entity-relationship diagram showing the database schemas for
multiple microservices in a [system name] architecture. Group entities by
microservice using subgraphs. Show how entities relate across service boundaries.
Include these microservices and their entities: [list microservice and their entities].
Use color coding to distinguish different microservice databases.
```

## Analytics/Reporting Schema ERD

```
Generate a Mermaid entity-relationship diagram for a data warehouse/analytics
schema for [system name]. Use a star or snowflake schema approach with fact
and dimension tables clearly identified. Include these key metrics and dimensions:
[list metrics and dimensions]. Show how the analytical tables relate to the
source operational tables. Add notes explaining aggregation strategies.
```

## Domain Event Sourcing ERD

```
Create a Mermaid entity-relationship diagram for an event-sourcing database
model for [domain name]. Include event store tables, snapshot tables, and
projection/view tables. Show the flow of events through the system and how
they build the various projections. Include these key domain events and entities:
[list events and entities]. Add notes explaining the event flow.
```

## Multi-Tenant Database ERD

```
Generate a Mermaid entity-relationship diagram for a multi-tenant [application type]
database. Show the tenant isolation strategy (shared schema, separate schemas, or
separate databases). Include tenant identification fields and security boundaries.
Focus on these core entities: [list entities]. Add notes explaining the tenant
isolation approach and security considerations.
```

## Temporal/Versioned Data ERD

```
Create a Mermaid entity-relationship diagram showing a temporal database design
for [system name] that tracks historical changes to entities. Include effective
dating or version fields in relevant entities. Show how historical queries
can be performed. Include these versioned entities: [list entities].
Add notes explaining the temporal query patterns.
```

## Navigation

- [🏠 Back to Main Page](../README.md)
- **Related Documents:**
  - [Prompt Templates Home](README.md)
  - [AI Diagram Generation Guide](../ai_diagram_generation_guide.md)
