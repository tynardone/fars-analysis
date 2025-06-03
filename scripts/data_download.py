import asyncio
import logging
import sqlite3 as sq3
import zipfile
from pathlib import Path

import httpx

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


BASE_URL = "https://static.nhtsa.gov/nhtsa/downloads/FARS/{year}/National/FARS{year}NationalCSV.zip"
DATA_DIR_ZIP = Path("fars_data_zip")
DATA_DIR_UNZIP = Path("fars_data_unzipped")
YEARS = range(2018, 2023)

DATA_DIR_ZIP.mkdir(exist_ok=True)
DATA_DIR_UNZIP.mkdir(exist_ok=True)

# Fetch ZIP files using urls
# Unzip files
# Clean data
# Figure out the database models
# Save to SQLITE database

# Connect to database
sq3.connect("nhsta_fars.db")


def extract_zip_to_named_folder(zip_path: Path) -> None:
    # Make folder name match zip file name (without extension)
    folder_name = zip_path.stem
    extract_to = DATA_DIR_UNZIP / folder_name

    extract_to.mkdir(exist_ok=True)

    with zipfile.ZipFile(zip_path) as z:
        # z.extractall(path=extract_to)
        print(z.filelist)


async def download_zip(client: httpx.AsyncClient, year: int) -> None:
    url = BASE_URL.format(year=year)
    file_destination = DATA_DIR_ZIP / f"FARS{year}National.zip"

    try:
        logger.info(f"Downloading {url}")
        response = await client.get(url)
        response.raise_for_status()
        file_destination.write_bytes(response.content)
        logger.info(f"Downloaded {year} ZIP to {file_destination}")
    except httpx.RequestError as exc:
        logger.exception(f"Request failed for {url}: {exc}")
    except httpx.HTTPStatusError as exc:
        logger.exception(f"Error response {exc.response.status_code} for {url}")


async def main():
    async with httpx.AsyncClient() as client:
        await asyncio.gather(*(download_zip(client, year) for year in YEARS))

    for zip_file in DATA_DIR_ZIP.glob("*.zip"):
        # for each ZIP file in the zip directory, extract it and save files
        # to a folder in the unzip directory
        extract_zip_to_named_folder(zip_file)

        logger.info(f"Unzipped {zip_file.name} to {DATA_DIR_UNZIP}")


if __name__ == "__main__":
    # asyncio.run(main())
    with zipfile.ZipFile("fars_data_zip/FARS2022National.zip", "r") as zf:
        for i in zf.filelist:
            print(i, "\n")
