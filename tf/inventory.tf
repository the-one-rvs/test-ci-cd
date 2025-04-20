resource "null_resource" "generate_inventory" {
  provisioner "local-exec" {
    command = <<EOT
echo "[strapi]
${aws_instance.strapi_instance.public_ip} ansible_user=ubuntu" > ../ansible/inventory.ini
EOT
  }

  depends_on = [aws_instance.strapi_instance]
}
