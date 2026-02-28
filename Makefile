.PHONY: help install run test clean docker-build docker-run docker-stop lint format

.DEFAULT_GOAL := help

help: ## Show this help message
	@echo 'Truth Lens - Available Commands'
	@echo '================================'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

install: ## Install dependencies
	@echo "Installing dependencies..."
	pip install -r requirements.txt
	@echo "✓ Dependencies installed"

run: ## Run Streamlit app
	@echo "Starting Truth Lens..."
	streamlit run app.py

test: ## Run tests
	@echo "Running tests..."
	pytest tests/ -v

clean: ## Remove cache files
	@echo "Cleaning cache files..."
	find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
	find . -type f -name "*.pyc" -delete
	find . -type f -name "*.pyo" -delete
	find . -type f -name "*.log" -delete
	@echo "✓ Cache cleaned"

docker-build: ## Build Docker image
	@echo "Building Docker image..."
	docker build -t truth-lens:latest .
	@echo "✓ Docker image built"

docker-run: ## Run Docker container
	@echo "Running Docker container..."
	docker-compose up -d
	@echo "✓ Container running at http://localhost:8501"

docker-stop: ## Stop Docker container
	@echo "Stopping Docker container..."
	docker-compose down
	@echo "✓ Container stopped"

docker-logs: ## View Docker logs
	docker-compose logs -f

lint: ## Lint code with flake8
	@echo "Linting code..."
	flake8 app.py --max-line-length=100
	@echo "✓ Linting complete"

format: ## Format code with black
	@echo "Formatting code..."
	black app.py
	@echo "✓ Formatting complete"

setup: ## Complete setup (install + download models)
	@echo "Setting up Truth Lens..."
	$(MAKE) install
	chmod +x download_models.sh setup.sh
	./download_models.sh
	@echo "✓ Setup complete!"

models: ## Download pre-trained models
	@echo "Downloading models..."
	chmod +x download_models.sh
	./download_models.sh
