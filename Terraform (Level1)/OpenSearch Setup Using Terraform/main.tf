resource "aws_opensearch_domain" "xfusion-es" {
  domain_name    = "xfusion-es"
  engine_version = "Elasticsearch_7.10"

  cluster_config {
    instance_type = "t3.small.search"
  }

  tags = {
    Domain = "TestDomain"
  }
}