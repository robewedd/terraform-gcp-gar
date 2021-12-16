variable "required_gar_apis" {
  type = map(any)
  default = {
    resourcemanager  = "cloudresourcemanager.googleapis.com"
    artifactregistry = "artifactregistry.googleapis.com"
  }
}

variable "project_id" {
  type        = string
  default     = ""
  description = "A project ID different from the default defined inside the provider"
}

variable "use_existing_service_account" {
  type        = bool
  default     = false
  description = "Set this to true to use an existing Service Account. When using an existing service account, the required roles must be added manually."
}

variable "service_account_name" {
  type        = string
  default     = ""
  description = "The Service Account name (required when use_existing_service_account is set to true). This can also be used to specify the new service account name when use_existing_service_account is set to false"
}

variable "service_account_private_key" {
  type        = string
  default     = ""
  description = "The private key in JSON format, base64 encoded (required when use_existing_service_account is set to true)"
}

variable "prefix" {
  type        = string
  default     = "lw-gar"
  description = "The prefix that will be use at the beginning of every generated resource"
}

variable "lacework_integration_name" {
  type        = string
  default     = "TF GAR"
  description = "The integration name displayed in the Lacework UI."
}

variable "wait_time" {
  type        = string
  default     = "10s"
  description = "Amount of time to wait before the next resource is provisioned."
}

variable "registry_domain" {
  type        = string
  default     = "us-docker.pkg.dev"
  description = "The GAR domain, which specifies the location where you store the images. Supported domains should follow the format of (region|zone)-docker.pkg.dev"
}

variable "limit_by_tags" {
  type        = list(any)
  default     = []
  description = "An image tag to limit the assessment of images with matching tag. If you specify limit_by_tag and limit_by_label limits, they function as an AND. Supported field input are mytext*mytext, mytext, mytext*, or mytext. Only one * wildcard is supported"
}

variable "limit_by_label" {
  type = list(any)
  default = [{
    "" = ""
  }]
  description = "An image label to limit the assessment of images with matching label. If you specify limit_by_tag and limit_by_label limits, they function as an AND.  Input is \"key\" = \"value\""
}

variable "limit_by_repositories" {
  type        = list(any)
  default     = []
  description = "A comma-separated list of repositories to assess. Defaults to empty (will assess all repositories in the registry)."
}

variable "limit_num_imgs" {
  type        = string
  default     = "5"
  description = "The maximum number of newest container images to assess per repository. Must be one of 5, 10, or 15"
}

variable "non_os_package_support" {
  type        = bool
  default     = true
  description = "Whether or not the integration should check non-os packages in the container for vulnerabilities"
}
