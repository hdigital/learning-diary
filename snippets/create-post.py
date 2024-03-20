"""This module creates a post draft from a template folder."""

import os
import shutil
from datetime import datetime

# Check if the script is run in the current folder
if os.getcwd() != os.path.dirname(os.path.abspath(__file__)):
    raise Exception("The script is not run in the current folder.")

## Create folder with current date from template

current_date = datetime.now().strftime("%Y-%m-%d")

source_folder = "../posts/2024-z-template/"
destination_folder = f"../posts/{current_date}-post/"

shutil.copytree(source_folder, destination_folder)

## Update date in header

file_path = destination_folder + "index.qmd"

with open(file_path) as file:
    file_data = file.read()

file_data = file_data.replace('"2024-0x-xx"', f'"{current_date}"')

with open(file_path, "w") as file:
    file.write(file_data)
