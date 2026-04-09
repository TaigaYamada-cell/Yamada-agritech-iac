output "iot_thing_name" {
  description = "Name of the IoT Thing"
  value       = aws_iot_thing.thing.name
}

output "iot_thing_arn" {
  description = "ARN of the IoT Thing"
  value       = aws_iot_thing.thing.arn
}

output "certificate_arn" {
  description = "ARN of the IoT certificate"
  value       = aws_iot_certificate.cert.arn
}

output "certificate_pem" {
  description = "Device certificate in PEM format"
  value       = aws_iot_certificate.cert.certificate_pem
  sensitive   = true
}

output "private_key" {
  description = "Private key for the certificate"
  value       = aws_iot_certificate.cert.private_key
  sensitive   = true
}

output "public_key" {
  description = "Public key for the certificate"
  value       = aws_iot_certificate.cert.public_key
  sensitive   = true
}

output "iot_endpoint" {
  description = "AWS IoT Core endpoint address"
  value       = data.aws_iot_endpoint.endpoint.endpoint_address
}
