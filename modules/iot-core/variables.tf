variable "thing_name" {
  description = "Name of the IoT Thing"
  type        = string
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}
