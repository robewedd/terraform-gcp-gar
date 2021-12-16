provider "lacework" {}

provider "google" {}

module "lacework_gar" {
  source = "../.."
  non_os_package_support = true
}
