<!--
mode: auto
tools: vscode-markdown, mermaid-preview
-->

# 📊 Data Analysis Dashboard Template

Create a comprehensive dashboard combining multiple chart types for data analysis.

## Requirements

- Analysis scope: [business metrics/system performance/user behavior]
- Time range: [real-time/historical/predictive]
- Data sources: [list data origins]
- Update frequency: [real-time/daily/weekly]

## Components

Define the following:
1. Key Metrics
   - Primary KPIs
   - Trend indicators
   - Comparison metrics
2. Chart Types
   - Time series graphs
   - Distribution charts
   - Comparison visualizations
3. Data Breakdowns
   - Segmentation analysis
   - Cohort comparisons
   - Geographic distribution
4. Interactive Elements
   - Filters
   - Drill-down paths
   - Time range selectors

## Styling Guidelines

- Use consistent color scheme
- Show clear data labels
- Include units and scales
- Add trend indicators
- Highlight anomalies

## Expected Output

A multi-part Mermaid visualization combining various chart types.

## Example Format

```mermaid
graph TB
    subgraph Key_Metrics["Key Performance Metrics"]
        direction LR
        M1[Users: 1.2M] --> M2[Growth: +15%]
        M3[Revenue: $2.4M] --> M4[Growth: +22%]
    end

    subgraph Time_Series["Usage Trends"]
        direction TB
        xychart-beta
            title "Monthly Active Users"
            x-axis [Jan, Feb, Mar, Apr, May]
            y-axis "Users (K)" 400 -- 1200
            line [500, 600, 750, 900, 1200]
    end

    subgraph Distribution["User Distribution"]
        pie
            title "User Segments"
            "Free" : 45
            "Pro" : 30
            "Enterprise" : 25
    end

    subgraph Engagement["User Engagement"]
        quadrantChart
            title Engagement Matrix
            x-axis Low Activity --> High Activity
            y-axis Low Value --> High Value
            quadrant-1 "Convert"
            quadrant-2 "Retain"
            quadrant-3 "Monitor"
            quadrant-4 "Activate"
    end

    classDef metric fill:#e3f2fd,stroke:#2196f3
    classDef chart fill:#f3e5f5,stroke:#9c27b0
    
    class M1,M2,M3,M4 metric
    class Time_Series,Distribution,Engagement chart
```

## Additional Context

1. Data Integration
   - Data refresh rates
   - Source systems
   - Caching strategy

2. Interactivity Requirements
   - Click behaviors
   - Tooltip content
   - Cross-filtering

3. Performance Considerations
   - Data volume handling
   - Loading optimizations
   - Browser compatibility

4. Analysis Features
   - Anomaly detection
   - Forecasting
   - Correlation analysis

5. Export Capabilities
   - Report generation
   - Data download
   - Sharing options
