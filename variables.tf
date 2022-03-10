variable "json_directory" {
  type = string
  description = "Path to the directory containing the JSON variable files"
  validation {
    condition = length(fileset(format("%s/", trimsuffix(var.json_directory, "/")), "*.json")) > 0
    error_message = "The variable set directory either does not exist, or does not contain any .json files."
  }
}