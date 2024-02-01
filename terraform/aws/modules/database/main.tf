# database main

##
# dynamodb tables
##
resource "aws_dynamodb_table" "lights" {
  count = length(var.table_names)

  name=var.table_names[count.index]
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "id"

  attribute {
    name="id"
    type="N"
  }

    tags = {
        ManagedBy="Terraform"
    }
}