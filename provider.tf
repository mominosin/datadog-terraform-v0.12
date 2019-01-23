variable "datadog_api_key" {
  default = ""
}

variable "datadog_app_key" {
  default = ""
}

provider "datadog" {
  api_key = "${var.datadog_api_key}"
  app_key = "${var.datadog_app_key}"
}
