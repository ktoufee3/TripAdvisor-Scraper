#!/bin/bash



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

# Install playwright
pip install playwright chromium

# run login_tripadvisor.py  to login and save cookies
python login_tripadvisor.py

echo "=========================================="
echo "Starting Scraper"
echo "=========================================="

# Run scraper
python tripadvisor_scraper.py
echo "Enter city name: "

echo "=========================================="
echo "Scraping Completed"
echo "=========================================="