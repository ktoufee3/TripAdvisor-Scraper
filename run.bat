@echo off
setlocal enabledelayedexpansion

REM ==========================================
REM TripAdvisor Scraper Runner
REM ==========================================

REM Check if city name is provided
if "%~1"=="" (
    echo Usage: run.bat ^<city_name^>
    echo Example: run.bat Islamabad
    exit /b 1
)

set CITY_NAME=%*

echo ==========================================
echo TripAdvisor Scraper
echo ==========================================

REM Create virtual environment if it doesn't exist
if not exist "venv\" (
    echo Creating virtual environment...
    python -m venv venv
)

REM Activate virtual environment
echo Activating virtual environment...
call venv\Scripts\activate.bat

REM Upgrade pip
echo Upgrading pip...
python -m pip install --upgrade pip

REM Install dependencies
echo Installing requirements...
pip install -r requirements.txt

echo ==========================================
echo Starting Scraper
echo City: %CITY_NAME%
echo ==========================================

REM Run scraper
python TripAdvisor_scraper.py --city "%CITY_NAME%"

echo ==========================================
echo Scraping Completed
echo ==========================================

pause