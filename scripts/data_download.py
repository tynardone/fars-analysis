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

        if all_under_same_prefix:
            for member in members:
                member_path = Path(member)
                parts = member_path.parts[1:]  # skip top-level folder
                if parts:
                    out_path = target_dir.joinpath(
                        *parts
                    )  # e.g. FARS2018National/accidents.csv
                    out_path.parent.mkdir(parents=True, exist_ok=True)

                    with zf.open(member) as source, open(out_path, "wb") as target:
                        target.write(source.read())

        else:
            zf.extractall(path=target_dir)


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
        unzip_fars(zip_file, DATA_DIR_UNZIP)

        logger.info(f"Unzipped {zip_file.name} to {DATA_DIR_UNZIP}")


if __name__ == "__main__":
    asyncio.run(main())
