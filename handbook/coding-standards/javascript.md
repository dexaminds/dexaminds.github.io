## 💻 JavaScript Coding Standards (DexaMinds)

### 1. General Guidelines
- Follow the [Airbnb Style Guide](https://github.com/airbnb/javascript)
- Use `const` and `let` (avoid `var`)
- Prefer modern ES6+ features

### 2. File and Variable Naming
- Use `camelCase` for variables/functions
- Use `PascalCase` for components/classes
- File names: `kebab-case.js` (e.g., `user-profile.js`)

### 3. Formatting
- 2-space indentation
- Always use semicolons
- Prefer single quotes
- Use trailing commas in multi-line objects/arrays
```js
const user = {
  name: 'Alice',
  age: 30,
};
```

### 4. Functions
- Use arrow functions for anonymous and short functions
```js
const greet = name => `Hello, ${name}`;
```
- Avoid deeply nested callbacks (prefer async/await or Promises)

### 5. Comments & Documentation
- Use `//` for single-line, `/** */` for multi-line
- Use JSDoc for public functions
```js
/**
 * Calculate sum of two numbers.
 * @param {number} a - First number
 * @param {number} b - Second number
 * @returns {number}
 */
function add(a, b) {
  return a + b;
}
```

### 6. Objects & Arrays
- Use destructuring where appropriate
```js
const { name, age } = user;
```
- Avoid mutation — prefer immutable updates

### 7. Error Handling
- Store constants and helper functions in their own files

### 8. State Management
- Use state management libraries (Redux, Context API) for global state
- Keep state as local as possible, lift state up when needed

### 9. Performance Optimization
- Use `useMemo` and `useCallback` for expensive calculations and callbacks
- Implement code splitting for large applications
- Use `React.memo` for preventing unnecessary re-renders

### 10. Security Practices
- Sanitize all user inputs
- Use environment variables for sensitive data
- Implement proper CORS policies
- Use Content Security Policy (CSP) headers

### 11. Testing
- Write unit tests with Jest
- Aim for 80%+ test coverage
- Test user interactions with React Testing Library

### 12. Error Boundaries
- Implement error boundaries to catch JavaScript errors
- Provide fallback UIs for better user experience

### 13. Accessibility (a11y)
- Use semantic HTML elements
- Add proper ARIA attributes
- Ensure keyboard navigation works
- Test with screen readers

### 14. Code Organization
- Follow the "Feature First" folder structure
- Keep related files together (component + styles + tests)
- Separate business logic from UI components

### 15. Performance Monitoring
- Implement error tracking (Sentry, LogRocket)
- Monitor Core Web Vitals
- Use React DevTools Profiler

### 16. Internationalization (i18n)
- Externalize all UI strings
- Use libraries like react-i18next
- Consider RTL (Right-to-Left) layouts

### 17. Code Reviews
- Keep PRs small and focused
- Include screenshots for UI changes
- Address all review comments before merging
- Use meaningful commit messages