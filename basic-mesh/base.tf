# pull region from provider
data "aws_region" "current" {}

locals {
  name       = "istio-basic"
  env_prefix = "test"
  region     = data.aws_region.current.name

  region_az_labels = {
    us-west-2  = "usw2"
    us-west-2a = "usw2a"
    us-west-2b = "usw2b"
    us-west-2c = "usw2c"
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
  }

  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }

  tags = {
    Blueprint  = local.name
    GithubRepo = "github.com/JudeQuintana/terraform-main/istio-experiment"
  }

  istio_chart_url     = "https://istio-release.storage.googleapis.com/charts"
  istio_chart_version = "1.26.1"
}

