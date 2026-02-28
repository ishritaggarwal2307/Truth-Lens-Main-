#!/bin/bash
# Truth Lens - Model Download Script

echo "================================"
echo "Truth Lens - Downloading Models"
echo "================================"
echo ""

# Create models directory
mkdir -p models

# GitHub Release URL (update with your actual release URL)
RELEASE_URL="https://github.com/yourusername/truth-lens/releases/download/v1.0.0"

# Model files
MODELS=(
    "xgb_model.pkl"
    "rf_model.pkl"
    "scaler.pkl"
    "cov_matrix.pkl"
)

# Download each model
for model in "${MODELS[@]}"; do
    echo "Downloading $model..."
    if command -v curl &> /dev/null; then
        curl -L "${RELEASE_URL}/${model}" -o "models/${model}"
    elif command -v wget &> /dev/null; then
        wget "${RELEASE_URL}/${model}" -O "models/${model}"
    else
        echo "❌ Error: Neither curl nor wget found. Please install one of them."
        exit 1
    fi
    
    if [ $? -eq 0 ]; then
        echo "✓ $model downloaded"
    else
        echo "❌ Failed to download $model"
        exit 1
    fi
done

echo ""
echo "Verifying downloads..."
ls -lh models/

echo ""
echo "================================"
echo "✓ Models downloaded successfully!"
echo "================================"
echo ""
echo "Next steps:"
echo "1. Run: streamlit run app.py"
echo "2. Open: http://localhost:8501"
