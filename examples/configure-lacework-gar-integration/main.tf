provider "google" {
}

provider "lacework" {}

module "lacework_gar" {
  source = "../../"

  # configure the Lacework Artifact Registry integration
  lacework_integration_name = "Example GAR integration"
  registry_domain           = "us-docker.pkg.dev"
  limit_by_tags             = ["example*"]
  limit_by_label            = ["example*"]
  limit_by_repositories     = ["foo","bar"]
  limit_num_imgs            = "10"
  non_os_package_support    = true
}
