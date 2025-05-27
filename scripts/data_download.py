import logging
import sqlite3 as sq3
import zipfile
from pathlib import Path

import httpx
from httpx import RequestError

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


BASE_URL = "https://static.nhtsa.gov/nhtsa/downloads/FARS/{year}/National/FARS{year}NationalCSV.zip"
DATA_DIR_ZIP = Path("fars_data_zip")
DATA_DIR_UNZIP = Path("fars_data_unzipped")
YEARS = range(2022, 2023)

DATA_DIR_ZIP.mkdir(exist_ok=True)
DATA_DIR_UNZIP.mkdir(exist_ok=True)

# Fetch ZIP files using urls
# Unzip files
# Clean data
# Figure out the database models
# Save to SQLITE database

sq3.connect("nhsta_fars.db")

for year in YEARS:
    url = BASE_URL.format(year=year)
    file_destination = DATA_DIR_ZIP / f"FARS{year}National.zip"

    try:
        response = httpx.get(url)
        response.raise_for_status()
    except RequestError:
        logger.exception(f"Request failed for {url}")

    file_destination.write_bytes(response.content)


for file in DATA_DIR_ZIP.iterdir():
    if "FARS" in file.stem:
        # unzip
        with zipfile.ZipFile(file) as fz:
            fz.extractall(path=DATA_DIR_UNZIP)
