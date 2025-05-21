import logging
from pathlib import Path

import httpx
from httpx import RequestError

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)
# https://static.nhtsa.gov/nhtsa/downloads/FARS/1975/National/FARS1975NationalCSV.zip

# https://static.nhtsa.gov/nhtsa/downloads/FARS/{year}/National/FARS{year}NationalCSV.zip

BASE_URL = "https://static.nhtsa.gov/nhtsa/downloads/FARS/{year}/National/FARS{year}NationalCSV.zip"
DATA_DIR = Path("fars_data")
YEARS = range(1975, 2023)

DATA_DIR.mkdir(exist_ok=True)


for year in YEARS:
    url = BASE_URL.format(year=year)
    file_destination = DATA_DIR / f"FARS{year}National.zip"

    try:
        response = httpx.get(url)
        response.raise_for_status()
    except RequestError:
        logger.exception(f"Request failed for {url}")

    file_destination.write_bytes(response.content)
