# database variables

variable "table_names" {
  description = "list of dynamodb tables, created for: iterating over to create each table in list"
  type = list(string)
}