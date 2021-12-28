# pass
resource "aws_elasticsearch_domain" "without_cluster_config" {
  domain_name = "without_cluster_config"
  tags = {
    yor_trace = "eb45724e-43c9-415b-a701-c00513f7fe3e"
  }
}

resource "aws_elasticsearch_domain" "without_instance_count" {
  domain_name = "without_instance_count"

  cluster_config {}
  tags = {
    yor_trace = "5c825e1c-3504-47a5-9534-63f720cca747"
  }
}

resource "aws_elasticsearch_domain" "instance_count_not_bigger_than_1" {
  domain_name = "instance_count_not_bigger_than_1"

  cluster_config {
    instance_count = 1 // a value <= 1
  }
  tags = {
    yor_trace = "fe3a688e-0785-4ddb-bb70-fccc226fcaa9"
  }
}

resource "aws_elasticsearch_domain" "node_to_node_encryption_enabled" {
  domain_name = "node_to_node_encryption_enabled"

  cluster_config {
    instance_count = 2 // a value > 1
  }

  node_to_node_encryption {
    enabled = true
  }
  tags = {
    yor_trace = "35b1bb82-e1e1-447a-963e-dfe063cce2d6"
  }
}

resource "aws_elasticsearch_domain" "old_hcl" {
  domain_name = "old_hcl"

  cluster_config = {
    instance_count = 2
  }

  node_to_node_encryption = {
    enabled = true
  }
  tags = {
    yor_trace = "266ffc79-0219-44fa-8341-cb1eaec05b54"
  }
}

# fail
resource "aws_elasticsearch_domain" "node_to_node_encryption_disabled" {
  domain_name = "node_to_node_encryption_disabled"

  cluster_config {
    instance_count = 2 // a value > 1
  }

  node_to_node_encryption {
    enabled = false
  }
  tags = {
    yor_trace = "53eb5a7a-affa-4c8f-a7d7-96108a82d31f"
  }
}

resource "aws_elasticsearch_domain" "node_to_node_encryption_doesnt_exist" {
  domain_name = "node_to_node_encryption_doesnt_exist"

  cluster_config {
    instance_count = 2 // a value > 1
  }
  tags = {
    yor_trace = "cc9ff07c-8b9f-461f-a594-b1ccc4cb46ef"
  }
}

# unknown
resource "aws_elasticsearch_domain" "instance_count_not_number" {
  domain_name = "instance_count_not_number"

  cluster_config {
    instance_count = "not_int"
  }
  tags = {
    yor_trace = "8aafef75-f9b1-4592-aac2-187308e69ed6"
  }
}