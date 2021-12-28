# pass

resource "aws_elasticache_cluster" "enabled" {
  cluster_id           = "cluster"
  engine               = "redis"
  node_type            = "cache.m5.large"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis6.x"

  snapshot_retention_limit = 5
  tags = {
    yor_trace = "b97df619-f0cb-4dd8-813b-986023a391c2"
  }
}

# failure

resource "aws_elasticache_cluster" "default" {
  cluster_id           = "cluster"
  engine               = "redis"
  node_type            = "cache.m5.large"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis6.x"
  tags = {
    yor_trace = "76dd7c10-edba-49f4-ac39-6f63201c38f6"
  }
}

resource "aws_elasticache_cluster" "disabled" {
  cluster_id           = "cluster"
  engine               = "redis"
  node_type            = "cache.m5.large"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis6.x"

  snapshot_retention_limit = 0
  tags = {
    yor_trace = "3bcb655f-d348-4de7-b99c-89e18013e5a7"
  }
}

# unknown

resource "aws_elasticache_cluster" "memcached" {
  cluster_id           = "cluster"
  engine               = "memcached"
  node_type            = "cache.m5.large"
  num_cache_nodes      = 1
  parameter_group_name = "default.memcached1.6 "
  tags = {
    yor_trace = "ae692860-98e2-444d-b5dc-f8900891936d"
  }
}
