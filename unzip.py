import zipfile

with zipfile.ZipFile("fars_data_zip/FARS2016National.zip", "r") as zf:
    zf.extractall()
