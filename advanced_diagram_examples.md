# 🚀 Advanced Diagram Examples with Mermaid

> This document showcases more advanced diagram techniques using Mermaid in VS Code. These examples demonstrate the power and flexibility of code-based diagramming.

[![Mermaid](https://img.shields.io/badge/Mermaid-8A2BE2?style=for-the-badge&logo=mermaid&logoColor=white)](https://mermaid.js.org/)
[![VS Code](https://img.shields.io/badge/VS_Code-1.100+-007ACC?style=for-the-badge&logo=visual-studio-code&logoColor=white)](https://code.visualstudio.com/)
[![Markdown](https://img.shields.io/badge/Markdown-000000?style=for-the-badge&logo=markdown&logoColor=white)](https://www.markdownguide.org/)

## 🔄 1. State Diagram Example

State diagrams are useful for showing how a system or component changes states in response to events.

| Use Cases | Benefits |
|-----------|----------|
| 🔹 User workflows | Visualize complex state transitions |
| 🔹 Application lifecycle | Document system behavior |
| 🔹 Process management | Identify edge cases and error states |

```mermaid
stateDiagram-v2
    [*] --> Idle
    
    state "User Authentication" as Auth {
        Idle --> LoginForm: Click Login
        LoginForm --> Validating: Submit
        Validating --> LoginForm: Invalid Credentials
        Validating --> Authenticated: Valid Credentials
    }
    
    Authenticated --> Dashboard: Load User Data
    
    state "User Session" as Session {
        Dashboard --> ViewProfile: Click Profile
        Dashboard --> BrowseProducts: Click Products
        Dashboard --> ViewCart: Click Cart
        
        ViewProfile --> EditProfile: Click Edit
        EditProfile --> ViewProfile: Save Changes
        
        BrowseProducts --> ProductDetails: Select Product
        ProductDetails --> ViewCart: Add to Cart
        
        ViewCart --> Checkout: Click Checkout
        Checkout --> OrderConfirmation: Place Order
    }
    
    OrderConfirmation --> Dashboard: Continue Shopping
    Dashboard --> Idle: Logout
    
    note right of Auth: User enters credentials
    note left of Session: User performs actions
```

## 📊 2. Entity-Relationship Diagram

ER diagrams help visualize database structure and relationships.

| Use Cases | Benefits |
|-----------|----------|
| 🔹 Database design | Clarify data models and relationships |
| 🔹 Data architecture | Document schema design decisions |
| 🔹 System integration | Map data flows between systems |

```mermaid
erDiagram
    CUSTOMER ||--o{ ORDER : places
    CUSTOMER {
        string customer_id PK
        string name
        string email
        string address
        date registration_date
    }
    ORDER ||--|{ ORDER_ITEM : contains
    ORDER {
        string order_id PK
        string customer_id FK
        date order_date
        string status
        float total_amount
    }
    PRODUCT ||--o{ ORDER_ITEM : included_in
    PRODUCT {
        string product_id PK
        string name
        string description
        float price
        int inventory_count
        string category
    }
    ORDER_ITEM {
        string order_item_id PK
        string order_id FK
        string product_id FK
        int quantity
        float unit_price
        float subtotal
    }
    CATEGORY ||--o{ PRODUCT : categorizes
    CATEGORY {
        string category_id PK
        string name
        string description
    }
    CUSTOMER ||--o{ REVIEW : writes
    PRODUCT ||--o{ REVIEW : receives
    REVIEW {
        string review_id PK
        string customer_id FK
        string product_id FK
        int rating
        string comment
        date review_date
    }
```

## 📅 3. Gantt Chart for Project Planning

Gantt charts are perfect for visualizing project timelines and dependencies.

| Use Cases | Benefits |
|-----------|----------|
| 🔹 Project roadmaps | Visualize project timelines |
| 🔹 Sprint planning | Track dependencies between tasks |
| 🔹 Resource allocation | Identify critical paths and bottlenecks |

```mermaid
gantt
    title Product Development Roadmap
    dateFormat  YYYY-MM-DD
    
    section Planning
    Market Research           :a1, 2025-01-01, 30d
    Competitive Analysis      :a2, after a1, 15d
    Requirements Gathering    :a3, after a2, 20d
    
    section Design
    UI/UX Design              :b1, after a3, 25d
    Architecture Design       :b2, after a3, 20d
    Design Review             :milestone, after b1, 0d
    
    section Implementation
    Core Features             :c1, after b1, 30d
    Integration               :c2, after b2, 25d
    Testing & QA              :c3, after c1, 20d
    Bug Fixes                 :c4, after c3, 10d
    
    section Launch
    Beta Release              :milestone, after c2, 0d
    User Acceptance Testing   :d1, after c4, 15d
    Documentation             :d2, after c4, 10d
    Marketing Preparation     :d3, after c4, 20d
    Public Launch             :milestone, after d1, 0d
```

## 🔀 4. Complex Flowchart with Subgraphs and Styling

Flowcharts can be enhanced with subgraphs, custom styling, and icons.

| Use Cases | Benefits |
|-----------|----------|
| 🔹 Decision trees | Visualize complex decision processes |
| 🔹 System workflows | Document multi-path user journeys |
| 🔹 Algorithm design | Break down complex logic into manageable sections |

```mermaid
flowchart TD
    %% Main entry point
    Start([Start]) --> CheckAuth{Authenticated?}
    
    %% Authentication flow
    subgraph Authentication
        CheckAuth -->|No| Login[Login Page]
        Login -->|Submit| ValidCreds{Valid Credentials?}
        ValidCreds -->|No| Login
        ValidCreds -->|Yes| SetSession[Set Session]
    end
    
    CheckAuth -->|Yes| MainMenu
    SetSession --> MainMenu
    
    %% Main application flows
    subgraph Application
        MainMenu[Main Menu] --> UserModule[User Management]
        MainMenu --> ContentModule[Content Management]
        MainMenu --> AnalyticsModule[Analytics]
        
        %% User management subflow
        subgraph "User Management"
            UserModule --> ListUsers[List Users]
            UserModule --> AddUser[Add User]
            UserModule --> EditUser[Edit User]
            
            AddUser --> ValidateUser{Validate?}
            ValidateUser -->|Invalid| AddUser
            ValidateUser -->|Valid| SaveUser[Save User]
            SaveUser --> ListUsers
            
            EditUser --> FindUser[Find User]
            FindUser --> UpdateUser[Update User]
            UpdateUser --> ValidateEditUser{Validate?}
            ValidateEditUser -->|Invalid| UpdateUser
            ValidateEditUser -->|Valid| SaveEditUser[Save Changes]
            SaveEditUser --> ListUsers
        end
        
        %% Content management subflow
        subgraph "Content Management"
            ContentModule --> ListContent[List Content]
            ContentModule --> AddContent[Create Content]
            ContentModule --> EditContent[Edit Content]
            
            AddContent --> ContentType{Content Type}
            ContentType -->|Article| ArticleEditor[Article Editor]
            ContentType -->|Video| VideoUpload[Video Upload]
            ContentType -->|Image| ImageUpload[Image Upload]
            
            ArticleEditor --> PreviewArticle[Preview]
            VideoUpload --> ProcessVideo[Process Video]
            ImageUpload --> ResizeImage[Resize Image]
            
            PreviewArticle --> PublishArticle[Publish]
            ProcessVideo --> PublishVideo[Publish]
            ResizeImage --> PublishImage[Publish]
            
            PublishArticle --> ListContent
            PublishVideo --> ListContent
            PublishImage --> ListContent
            
            EditContent --> FindContent[Find Content]
            FindContent --> ModifyContent[Modify Content]
            ModifyContent --> UpdateContent[Update Content]
            UpdateContent --> ListContent
        end
    end
    
    %% Logout flow
    MainMenu --> Logout[Logout]
    Logout --> ClearSession[Clear Session]
    ClearSession --> End([End])
    
    %% Styling
    classDef default fill:#f9f9f9,stroke:#333,stroke-width:1px
    classDef start fill:#d4edda,stroke:#28a745,stroke-width:2px
    classDef endNode fill:#f8d7da,stroke:#dc3545,stroke-width:2px
    classDef process fill:#e2f0fb,stroke:#0275d8,stroke-width:1px
    classDef decision fill:#fff3cd,stroke:#ffc107,stroke-width:1px
    classDef auth fill:#f5e8ff,stroke:#673ab7,stroke-width:1px
    
    class Start start
    class End endNode
    class MainMenu,UserModule,ContentModule,AnalyticsModule process
    class CheckAuth,ValidCreds,ContentType,ValidateUser,ValidateEditUser decision
    class Login,SetSession,ClearSession,Logout auth
```

## 🏗️ 5. C4 Architecture Diagram

C4 model diagrams help visualize software architecture at different levels of abstraction.

| Use Cases | Benefits |
|-----------|----------|
| 🔹 System context | Communicate high-level architecture concepts |
| 🔹 Container diagrams | Document system components and interactions |
| 🔹 Component diagrams | Map implementation structures and responsibilities |

```mermaid
C4Context
    title System Context Diagram for Online Shopping System
    
    Person(customer, "Customer", "A person who wants to buy products online")
    Person(admin, "Administrator", "A person who manages products and orders")
    
    System(shoppingSystem, "Online Shopping System", "Allows customers to browse products, place orders, and administrators to manage inventory")
    
    System_Ext(paymentSystem, "Payment Gateway", "Processes payments for orders")
    System_Ext(emailSystem, "Email System", "Sends emails for order confirmations and updates")
    System_Ext(shippingSystem, "Shipping Partner API", "Manages shipment of physical goods")
    
    Rel(customer, shoppingSystem, "Uses", "HTTPS")
    Rel(admin, shoppingSystem, "Manages", "HTTPS")
    Rel(shoppingSystem, paymentSystem, "Processes payments using", "HTTPS/API")
    Rel(shoppingSystem, emailSystem, "Sends emails using", "SMTP")
    Rel(shoppingSystem, shippingSystem, "Creates shipments using", "HTTPS/API")
    
    UpdateLayoutConfig($c4ShapeInRow="2", $c4BoundaryInRow="1")
```

## 📈 6. Advanced Sequence Diagram with Notes and Parallel Actions

Sequence diagrams can show complex interactions between system components.

| Use Cases | Benefits |
|-----------|----------|
| 🔹 API interactions | Document request/response patterns |
| 🔹 Microservice communication | Visualize service interactions |
| 🔹 Event-driven systems | Map complex event flows with parallel actions |

```mermaid
sequenceDiagram
    participant User
    participant Browser
    participant API as API Gateway
    participant Auth as Auth Service
    participant Orders as Order Service
    participant Payment as Payment Service
    participant DB as Database
    
    User->>Browser: Open application
    Browser->>API: GET /app
    API->>Browser: Return SPA
    Browser->>User: Show login screen
    
    User->>Browser: Enter credentials
    Browser->>API: POST /login (credentials)
    API->>Auth: Validate credentials
    Auth->>DB: Query user data
    DB->>Auth: Return user record
    
    alt Invalid credentials
        Auth->>API: Authentication failed
        API->>Browser: 401 Unauthorized
        Browser->>User: Show error message
    else Valid credentials
        Auth->>API: Generate JWT token
        API->>Browser: 200 OK with token
        Browser->>User: Show dashboard
        
        Note over User,Browser: User is now logged in
        
        User->>Browser: Create new order
        Browser->>API: POST /orders (order data)
        API->>Orders: Create order
        
        par Process Order
            Orders->>DB: Save order details
            DB->>Orders: Confirm save
        and Process Payment
            Orders->>Payment: Request payment
            Payment->>Payment: Process payment
            Payment->>Orders: Payment result
        end
        
        alt Payment successful
            Orders->>API: Order created
            API->>Browser: 200 OK with order details
            Browser->>User: Show confirmation
        else Payment failed
            Orders->>API: Payment error
            API->>Browser: 400 Payment Error
            Browser->>User: Show payment error
        end
    end
    
    opt User checks order status
        User->>Browser: View order history
        Browser->>API: GET /orders
        API->>Orders: Fetch orders
        Orders->>DB: Query orders
        DB->>Orders: Return order data
        Orders->>API: Order list
        API->>Browser: 200 OK with orders
        Browser->>User: Display orders
    end
```

## 🧩 Combining Multiple Diagram Types

Complex documentation often requires combining different diagram types to fully explain a system.

| Step | Diagram Type | Purpose |
|------|-------------|---------|
| 1️⃣ | Architecture Diagram | Show high-level system components and connections |
| 2️⃣ | Sequence Diagram | Illustrate key interactions between components |
| 3️⃣ | State Diagram | Document component lifecycle and states |
| 4️⃣ | Entity-Relationship Diagram | Map data models and relationships |

> 💡 **Pro Tip:** By using code-based diagrams in VS Code, you can keep all these diagrams in sync and evolve them alongside your code. Store diagram code in the same repository as your application code.

## 🧭 Navigation

| Document | Description |
|----------|-------------|
| [🏠 Main Page](README.md) | Return to the main documentation hub |
| [🔍 Class Diagram Example](class_diagram_example.md) | Examples of class diagrams and OOP modeling |
| [🏛️ System Architecture Example](system_architecture_example.md) | System architecture diagram examples |
| [📚 Practical Mermaid Guide](practical_mermaid_guide.md) | Guide to using Mermaid diagrams effectively |
| [✅ Diagram Validation Guide](diagram_validation_guide.md) | Validate and ensure diagram quality |

### 🛠️ Helpful Resources

| Resource | Description |
|----------|-------------|
| [Mermaid Live Editor](https://mermaid.live/) | Online editor and testing tool for Mermaid |
| [Mermaid Documentation](https://mermaid.js.org/syntax/stateDiagram.html) | Official syntax reference for all diagram types |
| [C4 Model](https://c4model.com/) | Official C4 architecture modeling reference |
