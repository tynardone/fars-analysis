import asyncio
import json
import logging
import logging.config
import os
import sqlite3 as sq3
import zipfile
from pathlib import Path
from typing import Iterable

import httpx

BASE_URL = "https://static.nhtsa.gov/nhtsa/downloads/FARS/{year}/National/FARS{year}NationalCSV.zip"
DATA_DIR_ZIP = Path("fars_data_zip")
DATA_DIR_UNZIP = Path("fars_data_unzipped")
YEARS = range(1975, 2023)

DATA_DIR_ZIP.mkdir(exist_ok=True)
DATA_DIR_UNZIP.mkdir(exist_ok=True)

LOGGING_CONFIG = "logging_config.json"

# Ensure logging works no matter what
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


def setup_logging():
    if os.path.exists(LOGGING_CONFIG):
        try:
            with open(LOGGING_CONFIG, "r") as f:
                config = json.load(f)
                logging.config.dictConfig(config)
                logger.debug("Loaded custom logging config.")
        except Exception:
            logger.exception(
                "Failed to load custom logging config. Using basic config."
            )
    else:
        logger.warning(
            f"Logging config file not found: {LOGGING_CONFIG}. Using basic config."
        )


setup_logging()


# Connect to database
sq3.connect("nhsta_fars.db")


def unzip_fars(zip_path: Path, dest_root: Path):
    """
    Unzips the `zip_path` zip file into a directory under `dest_root`.
    Ensures that the contents of zip file end up under dest_root / zip_stem / ....
    whether or not the zip itself contains the data files under a folder name.
    """

    zip_stem = zip_path.stem  # e.g. FARS2018National
    target_dir = dest_root / zip_stem

    with zipfile.ZipFile(zip_path, "r") as zf:
        members: list[str] = zf.namelist()
        common_prefix = Path(members[0]).parts[0]

        # Check if all members of the zip file have the same prefix. If so the prefix will
        # be removed to save just the file name
        all_under_same_prefix: bool = all(
            Path(m).parts[0] == common_prefix for m in members
        )

        for member in members:
            member_path = Path(member)
            parts: Iterable[str] = (
                member_path.parts[1:] if all_under_same_prefix else member_path.parts
            )
            # Lower case all the file names and file extensions
            parts = [p.lower() for p in parts]

            if not parts:
                continue  # skip if empty path

            out_path = target_dir.joinpath(
                *parts
            )  # e.g. FARS2018National/accidents.csv
            out_path.parent.mkdir(parents=True, exist_ok=True)

            with zf.open(member) as source, open(out_path, "wb") as target:
                target.write(source.read())


async def download_zip(client: httpx.AsyncClient, year: int) -> bool:
    url = BASE_URL.format(year=year)
    file_destination = DATA_DIR_ZIP / f"FARS{year}National.zip"

    try:
        logger.info(f"Downloading {url}")
        response = await client.get(url)
        response.raise_for_status()
        file_destination.write_bytes(response.content)
        logger.info(f"Downloaded {year} ZIP to {file_destination}")
        return True
    except httpx.RequestError as exc:
        logger.exception(f"Request failed for {url}: {exc}")
    except httpx.HTTPStatusError as exc:
        logger.exception(f"Error response {exc.response.status_code} for {url}")
    return False


async def main():
    async with httpx.AsyncClient() as client:
        results = await asyncio.gather(*(download_zip(client, year) for year in YEARS))

        successful_downloads = sum(results)

    for zip_file in DATA_DIR_ZIP.glob("*.zip"):
        # for each ZIP file in the zip directory, extract it and save files
        # to a folder in the unzip directory
        unzip_fars(zip_file, DATA_DIR_UNZIP)

        logger.info(f"Unzipped {zip_file.name} to {DATA_DIR_UNZIP}")

    logger.info(
        f"Successfully downloaded {successful_downloads}/{len(YEARS)} ZIP files."
    )


if __name__ == "__main__":
    asyncio.run(main())
