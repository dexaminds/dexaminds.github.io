## 🐍 Python Coding Standards (DexaMinds)

### 1. General Guidelines

- Follow [PEP 8](https://peps.python.org/pep-0008/)
- Max line length: 79 characters
- Prefer clarity over cleverness
- Avoid magic numbers, use named constants

### 2. File Naming

- Use `snake_case` for Python file names, e.g., `data_loader.py`
- Avoid dashes or capital letters in filenames

### 3. Indentation and Spacing

- Use 4 spaces for indentation (no tabs)
- Add blank lines between top-level functions and classes

### 4. Imports

- Standard library imports first, then third-party, then project-specific
- Use absolute imports when possible

```python
# Good
import os
import pandas as pd
from myproject.utils import helper
```

### 5. Docstrings

- Use triple double-quoted strings `"""` per [PEP 257](https://peps.python.org/pep-0257/)

```python
def fetch_data(source: str) -> dict:
    """
    Fetch data from a specified source.

    Args:
        source (str): The data source path.

    Returns:
        dict: Parsed data from the source.
    """
    pass
```

### 6. Naming Conventions

- `snake_case` for variables/functions
- `UPPER_CASE` for constants
- `PascalCase` for class names

### 7. Functions

- Keep them short and focused
- Prefer keyword arguments for clarity
- Include type hints

### 8. Classes

- Single responsibility per class
- Group related methods
- Use `__init__` constructor wisely

### 9. Error Handling

- Use `try...except` blocks for error handling
- Dependency management: `pip-tools` or `poetry`

### 10. Type Hinting
- Use type hints for all function parameters and return values
- Leverage `typing` module for complex types
- Add `# type: ignore` only when absolutely necessary

### 11. Virtual Environments
- Always use virtual environments for project dependencies
- Document all dependencies in `requirements.txt` or `pyproject.toml`
- Pin dependency versions for production

### 12. Logging
- Use the `logging` module instead of print statements
- Configure appropriate log levels (DEBUG, INFO, WARNING, ERROR)
- Include contextual information in log messages

### 13. Testing
- Write unit tests using `pytest`
- Follow the Arrange-Act-Assert pattern
- Aim for 80%+ test coverage
- Use fixtures for test dependencies

### 14. Performance
- Use list/dict comprehensions for simple loops
- Leverage generators for large datasets
- Profile code before optimizing (`cProfile`, `line_profiler`)

### 15. Security
- Use `secrets` module for cryptographic operations
- Sanitize all user inputs
- Avoid `eval()` and `exec()` with user input
- Use parameterized queries for database operations

### 16. Documentation
- Keep docstrings up-to-date with code changes
- Use Sphinx or MkDocs for project documentation
- Include examples in docstrings

### 17. Code Quality
- Run linters (`pylint`, `flake8`) in CI/CD
- Use `black` for code formatting
- Run `mypy` for static type checking

### 18. Concurrency
- Use `asyncio` for I/O-bound operations
- Prefer `concurrent.futures` for CPU-bound tasks
- Understand GIL limitations

### 19. Error Handling
- Create custom exception classes for domain-specific errors
- Use context managers (`with` statement) for resource management
- Include error recovery mechanisms where possible

### 20. Code Reviews
- Keep PRs focused and small
- Include type hints in all new code
- Document any non-obvious decisions
- Update documentation when changing behavior
