#!/bin/bash

# ==========================================
# TripAdvisor Scraper Runner
# ==========================================

# Check if city name is provided
if [ -z "$1" ]; then
    echo "Usage: ./run.sh <city_name>"
    echo "Example: ./run.sh Islamabad"
    exit 1
fi

CITY_NAME="$1"

echo "=========================================="
echo "TripAdvisor Scraper"
echo "=========================================="

# Create virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
fi

# Activate virtual environment
echo "Activating virtual environment..."
source venv/bin/activate

# Upgrade pip
echo "Upgrading pip..."
pip install --upgrade pip

# Install dependencies
echo "Installing requirements..."
pip install -r requirements.txt

echo "=========================================="
echo "Starting Scraper"
echo "City: $CITY_NAME"
echo "=========================================="

# Run scraper
python TripAdvisor_scraper.py --city "$CITY_NAME"

echo "=========================================="
echo "Scraping Completed"
echo "=========================================="