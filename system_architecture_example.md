# 🏗️ System Architecture Example: Microservices Application

This example demonstrates a system architecture diagram created using Mermaid flowchart syntax, showing the components and layers of a modern microservices-based application.

## 📊 Diagram

```mermaid
flowchart TB
    subgraph Client Layer
        Browser[Web Browser]
        MobileApp[Mobile Application]
        DesktopApp[Desktop Application]
    end
    
    subgraph API Gateway
        Gateway[API Gateway Service]
        Auth[Authentication Service]
        RateLimit[Rate Limiting]
    end
    
    subgraph Microservices
        UserService[User Service]
        ContentService[Content Service]
        AnalyticsService[Analytics Service]
        NotificationService[Notification Service]
    end
    
    subgraph Data Layer
        UserDB[(User Database)]
        ContentDB[(Content Database)]
        AnalyticsDB[(Analytics Database)]
        Cache[(Redis Cache)]
    end
    
    Browser --> Gateway
    MobileApp --> Gateway
    DesktopApp --> Gateway
    
    Gateway --> Auth
    Auth --> UserService
    Gateway --> RateLimit
    RateLimit --> ContentService
    RateLimit --> AnalyticsService
    RateLimit --> NotificationService
    
    UserService --> UserDB
    ContentService --> ContentDB
    AnalyticsService --> AnalyticsDB
    UserService --> Cache
    ContentService --> Cache
    
    classDef clientLayer fill:#F5F5F5,stroke:#333,stroke-width:1px;
    classDef gatewayLayer fill:#D3D3D3,stroke:#333,stroke-width:1px;
    classDef serviceLayer fill:#B0E0E6,stroke:#333,stroke-width:1px;
    classDef dataLayer fill:#FFE4B5,stroke:#333,stroke-width:1px;
    
    class Browser,MobileApp,DesktopApp clientLayer;
    class Gateway,Auth,RateLimit gatewayLayer;
    class UserService,ContentService,AnalyticsService,NotificationService serviceLayer;
    class UserDB,ContentDB,AnalyticsDB,Cache dataLayer;
```

## Navigation

- [🏠 Back to Main Page](README.md)
- **Related Documents:**
  - [Advanced Diagram Examples](advanced_diagram_examples.md)
  - [Class Diagram Example](class_diagram_example.md)
  - [AI Diagram Generation Guide](ai_diagram_generation_guide.md)
