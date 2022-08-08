resource "null_resource" "this" {
  triggers = {
    destroy_if_name_changed = var.name
  }
}
