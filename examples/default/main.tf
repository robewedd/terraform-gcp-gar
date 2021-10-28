provider "lacework" {}

provider "google" {}

module "lacework_gar" {
  source = "../.."
}
