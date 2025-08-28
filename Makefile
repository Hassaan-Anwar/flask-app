
VENV_DIR = .venv
PYTHON   = $(VENV_DIR)/bin/python
PIP      = $(VENV_DIR)/bin/pip

.PHONY: all install run test clean

# Run everything in order: venv -> install -> run -> test
all: venv install run test

# Create the virtual environment (only if it doesn’t exist)
venv: $(VENV_DIR)/bin/activate

$(VENV_DIR)/bin/activate:
	@echo "Creating virtual environment at $(VENV_DIR)..."
	python3 -m venv $(VENV_DIR)
	@echo "Virtual environment created."

# Install requirements
install: venv
	@echo "Installing requirements from requirements.txt..."
	$(PIP) install -r requirements.txt
	@echo "Requirements installed."

# Run the main app
run: venv
	@echo "Running the application..."
	$(PYTHON) app.py

# Run tests
test: venv
	@echo "Running tests..."
	$(PYTHON) -m pytest

# Clean everything
clean:
	@echo "Cleaning up..."
	find . -name "__pycache__" -exec rm -rf {} +
	find . -name "*.pyc" -exec rm -f {} +
	rm -rf $(VENV_DIR)
	rm -rf .pytest_cache
	@echo "Cleanup complete."
