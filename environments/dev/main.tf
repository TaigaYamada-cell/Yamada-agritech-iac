variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-northeast-1"
}

variable "thing_name" {
  description = "Name of the IoT Thing"
  type        = string
  default     = "esp32-dev-thing"
}

module "iot_core" {
  source = "../../modules/iot-core"

  thing_name = var.thing_name
  aws_region = var.aws_region
}
