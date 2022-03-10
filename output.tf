output "variables" {
  description = "Aggregate object of all variables from the source JSON files. Composed of keys for each JSON filename (without extension) with values from the JSON file."
  value = local.all_variables
}