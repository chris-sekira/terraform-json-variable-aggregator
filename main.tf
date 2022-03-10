terraform {
  required_version = ">= 1.1.0"
}

locals {
  # Defensively strip the trailing slash from the JSON file directory path
  normalized_json_directory = trimsuffix(var.json_directory, "/")

  # Enumerate all the JSON files in the directory
  json_files = fileset(local.normalized_json_directory, "*.json")

  # Aggregate all JSON file variables into a single object
  # Each file's variables will be stored under a top-level key corresponding to the filename without extension
  all_variables = {for json_file in local.json_files : trimspace(regex("^(\\w+)\\.json$", basename(json_file))[0]) => jsondecode(file(format("%s/%s", local.normalized_json_directory, json_file)))}
}