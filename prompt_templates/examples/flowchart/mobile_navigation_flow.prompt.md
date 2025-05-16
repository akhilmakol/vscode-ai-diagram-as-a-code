<!--
mode: auto
tools: vscode-markdown, mermaid-preview
-->

# 📱 Mobile App Navigation Flow Template

Create a comprehensive diagram showing mobile app navigation and screen flows.

## Requirements

- App type: [native/hybrid/web]
- Navigation pattern: [tab/drawer/stack]
- Authentication: [required/optional]
- Deeplink support: [yes/no]

## Components

Define the following:
1. Screen Hierarchy
   - Main screens
   - Sub-screens
   - Modal dialogs
   - Bottom sheets

2. Navigation Patterns
   - Tab navigation
   - Stack navigation
   - Drawer menu
   - Modal flows

3. User Flows
   - Authentication
   - Onboarding
   - Core features
   - Settings

4. State Management
   - Screen states
   - Navigation state
   - Data persistence
   - Cache handling

## Styling Guidelines

- Color code by flow type
- Show navigation hierarchy
- Indicate gestures
- Mark authentication points
- Highlight main paths

## Expected Output

A detailed Mermaid diagram showing the app navigation structure.

## Example Format

```mermaid
graph TB
    subgraph Auth["Authentication Flow"]
        direction TB
        Login[Login Screen]
        Register[Register Screen]
        Reset[Password Reset]
        
        Login --> Register
        Login --> Reset
    end

    subgraph Main["Main Navigation"]
        direction LR
        subgraph Tabs["Tab Navigation"]
            Home[Home Tab]
            Search[Search Tab]
            Profile[Profile Tab]
            Settings[Settings Tab]
        end
        
        subgraph Flows["Feature Flows"]
            Home --> Details[Item Details]
            Details --> Cart[Shopping Cart]
            Cart --> Checkout[Checkout]
            
            Search --> Results[Search Results]
            Results --> Details
            
            Profile --> Edit[Edit Profile]
            Profile --> Orders[Order History]
            Orders --> OrderDetail[Order Details]
        end
    end

    subgraph Modals["Modal Screens"]
        Filter[Filter Modal]
        Share[Share Sheet]
        Alert[Alert Dialog]
    end

    Login -->|Success| Main
    Search --> Filter
    Details --> Share
    Checkout --> Alert

    classDef auth fill:#e3f2fd,stroke:#1565c0
    classDef main fill:#c8e6c9,stroke:#2e7d32
    classDef modal fill:#fff3e0,stroke:#ef6c00
    classDef flow fill:#f3e5f5,stroke:#7b1fa2

    class Login,Register,Reset auth
    class Home,Search,Profile,Settings main
    class Filter,Share,Alert modal
    class Details,Cart,Checkout,Results,Edit,Orders,OrderDetail flow
```

## Additional Context

1. Navigation Architecture
   - Navigation patterns
   - Routing configuration
   - Deep linking
   - Screen transitions

2. User Experience
   - Gesture handling
   - Loading states
   - Error handling
   - Accessibility

3. State Management
   - Navigation state
   - Screen parameters
   - Data persistence
   - Cache strategy

4. Performance
   - Screen preloading
   - Memory management
   - Transition animations
   - Background behavior

5. Technical Considerations
   - Platform differences
   - Navigation libraries
   - State persistence
   - Analytics tracking
