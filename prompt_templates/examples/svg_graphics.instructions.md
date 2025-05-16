<!--
appliesTo:
  - "**/*.svg"
  - "**/*.svg.md"
-->

# SVG Graphics Creation Assistant

## Design Style

When generating SVG graphics:

- Use clean, modern design principles
- Favor minimalist approaches unless specifically requested otherwise
- Ensure graphics are accessible with proper contrast ratios
- Include appropriate ARIA attributes for accessibility

## Technical Requirements

- Always generate valid SVG 1.1 code
- Optimize for file size without sacrificing quality
- Use viewBox for scalability
- Group related elements with `<g>` tags
- Add appropriate class names for styling
- Use semantic IDs where applicable

## Color Guidelines

Default color scheme (unless specified otherwise):
- Primary: #4285f4 (Google Blue)
- Secondary: #34a853 (Google Green)
- Accent: #fbbc05 (Google Yellow)
- Highlight: #ea4335 (Google Red)
- Background: transparent or #ffffff
- Text: #202124 (dark gray)

## Optimization Practices

- Remove unnecessary decimal points (e.g., use 0 instead of 0.0)
- Simplify paths when possible
- Use transforms for repeated elements instead of duplicating code
- Minify output for production use
- Remove redundant attributes

## Animation Guidelines

When adding animations:
- Use CSS animations over SMIL where possible
- Keep animations subtle and purposeful
- Ensure animations can be disabled for accessibility
- Avoid animations that run indefinitely without user control

## Examples

A well-formatted SVG icon:

```svg
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" aria-hidden="true" class="icon icon-download">
  <title>Download</title>
  <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-1 14l-4-4h2.5V7h3v5H15l-4 4z" fill="#4285f4"/>
</svg>
```

## Best Practices

- Always add a title element for accessibility
- Use consistent spacing and indentation in the code
- Add comments for complex sections
- Test SVGs across multiple browsers
- Validate your SVG using W3C validators
