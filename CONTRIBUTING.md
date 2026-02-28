# Contributing to Truth Lens

Thank you for your interest in contributing to Truth Lens! This document provides guidelines and instructions for contributing.

## 🌟 Ways to Contribute

- 🐛 **Report bugs** - Help us identify and fix issues
- 💡 **Suggest features** - Share ideas for improvements
- 📖 **Improve documentation** - Make our docs clearer
- 🔧 **Submit code** - Fix bugs or add features
- 🎨 **Design improvements** - UI/UX enhancements

## 📋 Code of Conduct

By participating, you agree to uphold our [Code of Conduct](CODE_OF_CONDUCT.md). Please read it before contributing.

## 🐛 Reporting Bugs

Before submitting a bug report:
1. **Check existing issues** - Bug may already be reported
2. **Verify it's reproducible** - Test on latest version
3. **Gather information** - Error messages, environment details

### Bug Report Template

```markdown
**Description**
Clear description of the bug

**Steps to Reproduce**
1. Go to '...'
2. Upload '...'
3. See error

**Expected Behavior**
What you expected to happen

**Actual Behavior**
What actually happened

**Environment**
- OS: [e.g., Ubuntu 22.04]
- Python: [e.g., 3.10.5]
- Truth Lens: [e.g., 1.0.0]

**Additional Context**
Screenshots, error logs, etc.
```

## 💡 Suggesting Features

We love feature suggestions! Please include:

- **Problem statement** - What problem does this solve?
- **Proposed solution** - How would it work?
- **Use case** - Specific scenario where it's useful
- **Alternatives considered** - Other approaches you thought about

## 🔧 Development Setup

### Prerequisites

- Python 3.10+
- Git
- Virtual environment tool (venv/conda)

### Setup Instructions

```bash
# 1. Fork the repository on GitHub

# 2. Clone your fork
git clone https://github.com/YOUR_USERNAME/truth-lens.git
cd truth-lens

# 3. Add upstream remote
git remote add upstream https://github.com/ORIGINAL_OWNER/truth-lens.git

# 4. Create virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# 5. Install dependencies
pip install -r requirements.txt

# 6. Download models
./download_models.sh

# 7. Verify setup
streamlit run app.py
```

## 🔄 Pull Request Process

### 1. Create a Feature Branch

```bash
git checkout -b feature/amazing-feature
```

Branch naming conventions:
- `feature/` - New features
- `fix/` - Bug fixes
- `docs/` - Documentation changes
- `refactor/` - Code refactoring
- `test/` - Test additions

### 2. Make Your Changes

- Write clean, readable code
- Follow PEP 8 style guidelines
- Add comments for complex logic
- Update documentation as needed

### 3. Test Your Changes

```bash
# Run the application
streamlit run app.py

# Test with sample files
# Upload test_samples/*.wav
```

### 4. Commit Your Changes

```bash
git add .
git commit -m "feat: Add amazing feature"
```

**Commit message format:**
```
<type>: <description>

[optional body]

[optional footer]
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Formatting changes
- `refactor`: Code restructuring
- `test`: Test additions
- `chore`: Maintenance tasks

### 5. Push to Your Fork

```bash
git push origin feature/amazing-feature
```

### 6. Open Pull Request

- Go to GitHub and click "New Pull Request"
- Fill out the PR template completely
- Link related issues
- Request review from maintainers

## ✅ Code Review Checklist

Before submitting, ensure:

- [ ] Code follows PEP 8 style guide
- [ ] Functions have docstrings
- [ ] Complex logic has comments
- [ ] No debug print statements
- [ ] No hardcoded paths or credentials
- [ ] Tests pass (if applicable)
- [ ] Documentation is updated
- [ ] CHANGELOG.md is updated
- [ ] Commit messages are clear

## 📝 Coding Standards

### Python Style (PEP 8)

```python
# Good
def analyze_audio(file_path: str) -> dict:
    """
    Analyze audio file for authenticity.
    
    Args:
        file_path: Path to audio file
        
    Returns:
        dict: Analysis results
    """
    features = extract_features(file_path)
    return model.predict(features)

# Bad
def analyzeAudio(fp):
    f=extract_features(fp)
    return model.predict(f)
```

### Variable Naming

- `snake_case` for functions and variables
- `PascalCase` for classes
- `UPPER_CASE` for constants
- Descriptive names (avoid single letters except in loops)

### Documentation

```python
def complex_function(param1, param2):
    """
    Brief description of what function does.
    
    Longer description if needed.
    
    Args:
        param1 (type): Description of param1
        param2 (type): Description of param2
        
    Returns:
        type: Description of return value
        
    Raises:
        ValueError: When invalid input provided
    """
    pass
```

## 🧪 Testing Guidelines

### Manual Testing

```bash
# Test basic functionality
streamlit run app.py

# Test with various audio formats
# - WAV files (recommended)
# - MP3 files
# - Different sample rates

# Verify:
# - File upload works
# - Analysis completes
# - Results display correctly
# - PDF generation works
# - No console errors
```

### Edge Cases to Test

- Very short audio (<1 second)
- Very long audio (>30 seconds)
- Silent audio
- Noisy audio
- Different sample rates (8kHz, 16kHz, 44.1kHz)
- Non-audio files (should reject gracefully)

## 📖 Documentation

### Update README.md

If your changes affect:
- Installation process
- Usage instructions
- Features list
- Performance metrics

Update the README accordingly.

### Update Docs Folder

If adding major features, create documentation in `docs/`:
- Architecture changes → `docs/ARCHITECTURE.pdf`
- New ML models → `docs/MODEL_DETAILS.pdf`
- Deployment changes → `docs/DEPLOYMENT.pdf`

### Code Comments

```python
# Good comment - explains WHY
# Using Mahalanobis distance instead of Euclidean because
# it accounts for feature correlations and scale differences
distance = mahalanobis(features, mean, inv_cov)

# Bad comment - explains WHAT (code already shows this)
# Calculate distance
distance = mahalanobis(features, mean, inv_cov)
```

## 🚀 Release Process

Maintainers follow this process:

1. **Version Bump** - Update version in `__version__`
2. **CHANGELOG** - Document all changes
3. **Tag Release** - `git tag v1.x.x`
4. **Build Docker** - Update container
5. **Deploy** - Push to production

## ❓ Questions?

- **Technical questions**: Open a [GitHub Discussion](https://github.com/yourusername/truth-lens/discussions)
- **General questions**: Create an issue with `question` label
- **Private inquiries**: Email team@truth-lens.ai

## 🎉 Recognition

Contributors will be:
- Listed in CHANGELOG.md for their contributions
- Mentioned in release notes
- Added to CONTRIBUTORS.md (coming soon)

Thank you for making Truth Lens better! 🙏

---

**Happy Contributing!** 🚀
