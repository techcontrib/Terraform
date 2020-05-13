output "server_public_dns" {
  value = aws_instance.StageInstance.public_dns
}