#!/bin/bash
# Truth Lens - Complete Setup Script

echo "================================"
echo "Truth Lens - Automated Setup"
echo "================================"
echo ""

# Check Python version
echo "→ Checking Python version..."
python3 --version

if [ $? -ne 0 ]; then
    echo "❌ Python 3 not found. Please install Python 3.10+"
    exit 1
fi

# Check Python version >= 3.10
PYTHON_VERSION=$(python3 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
REQUIRED_VERSION="3.10"

if [ "$(printf '%s\n' "$REQUIRED_VERSION" "$PYTHON_VERSION" | sort -V | head -n1)" != "$REQUIRED_VERSION" ]; then
    echo "❌ Python 3.10+ required. Found: $PYTHON_VERSION"
    exit 1
fi

echo "✓ Python $PYTHON_VERSION detected"
echo ""

# Create virtual environment
echo "→ Creating virtual environment..."
python3 -m venv venv

if [ $? -ne 0 ]; then
    echo "❌ Failed to create virtual environment"
    exit 1
fi

echo "✓ Virtual environment created"
echo ""

# Activate virtual environment
echo "→ Activating virtual environment..."
source venv/bin/activate

# Upgrade pip
echo "→ Upgrading pip..."
pip install --quiet --upgrade pip

# Install dependencies
echo "→ Installing dependencies (this may take a few minutes)..."
pip install --quiet -r requirements.txt

if [ $? -ne 0 ]; then
    echo "❌ Failed to install dependencies"
    exit 1
fi

echo "✓ Dependencies installed"
echo ""

# Download models
echo "→ Downloading pre-trained models..."
chmod +x download_models.sh
./download_models.sh

if [ $? -ne 0 ]; then
    echo "❌ Failed to download models"
    exit 1
fi

echo ""
echo "================================"
echo "✓ Setup Complete!"
echo "================================"
echo ""
echo "To start Truth Lens:"
echo "1. Activate environment: source venv/bin/activate"
echo "2. Run application: streamlit run app.py"
echo "3. Open browser: http://localhost:8501"
echo ""
echo "Or use Make commands:"
echo "  make run        - Start application"
echo "  make help       - Show all commands"
echo ""
