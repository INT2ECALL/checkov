resource "aws_eks_cluster" "example_direct" {
  name                      = "example"
  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  tags = {
    yor_trace = "4ffa802b-dcc0-4b2c-8e88-78a508c2c20a"
  }
}

resource "aws_eks_cluster" "example_var" {
  name                      = "example"
  enabled_cluster_log_types = var.log_types_enabled
  tags = {
    yor_trace = "a37acb7d-5177-4098-b5c5-32f7ed1730ee"
  }
}

variable "log_types_enabled" {
  type    = list(string)
  default = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
}