output "iot_thing_name" {
  description = "Name of the IoT Thing"
  value       = module.iot_core.iot_thing_name
}

output "iot_endpoint" {
  description = "AWS IoT Core endpoint address"
  value       = module.iot_core.iot_endpoint
}

output "certificate_pem" {
  description = "Device certificate in PEM format"
  value       = module.iot_core.certificate_pem
  sensitive   = true
}

output "private_key" {
  description = "Private key for the certificate"
  value       = module.iot_core.private_key
  sensitive   = true
}

output "public_key" {
  description = "Public key for the certificate"
  value       = module.iot_core.public_key
  sensitive   = true
}
