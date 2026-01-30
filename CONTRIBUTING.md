# Contributing to Vimsor

Thanks for your interest in contributing to Vimsor!

## How to Contribute

### Reporting Bugs

1. Check if the bug has already been reported in [Issues](https://github.com/mignev/vimsor/issues)
2. If not, create a new issue with:
   - Clear description of the bug
   - Steps to reproduce
   - Your OS and Vim version (`vim --version`)
   - Relevant error messages

### Suggesting Features

1. Open an issue with the `enhancement` label
2. Describe the feature and why it would be useful
3. Include examples if possible

### Pull Requests

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/my-feature`
3. Make your changes
4. Test your changes
5. Commit with clear messages: `git commit -m "Add feature X"`
6. Push to your fork: `git push origin feature/my-feature`
7. Open a Pull Request

### Code Style

- Keep vimrc readable with clear comments
- Group related settings together
- Use descriptive names for functions
- Test on both macOS and Linux if possible

### Documentation

- Update README.md if adding new features
- Update CHEATSHEET.md if adding new keybindings
- Keep docs concise and practical

## Development Setup

```bash
# Clone your fork
git clone https://github.com/YOUR_USERNAME/vimsor.git
cd vimsor

# Create a test environment
mkdir -p /tmp/vimsor-test
HOME=/tmp/vimsor-test ./install.sh

# Test changes
HOME=/tmp/vimsor-test vim
```

## Questions?

Open an issue or reach out to [@mignev](https://github.com/mignev).
