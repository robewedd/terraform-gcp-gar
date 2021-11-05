<a href="https://lacework.com"><img src="https://techally-content.s3-us-west-1.amazonaws.com/public-content/lacework_logo_full.png" width="600"></a>

# terraform-gcp-gar

[![GitHub release](https://img.shields.io/github/release/lacework/terraform-gcp-gar.svg)](https://github.com/lacework/terraform-gcp-gar/releases/)
[![Codefresh build status]( https://g.codefresh.io/api/badges/pipeline/lacework/terraform-modules%2Ftest-compatibility?type=cf-1&key=eyJhbGciOiJIUzI1NiJ9.NWVmNTAxOGU4Y2FjOGQzYTkxYjg3ZDEx.RJ3DEzWmBXrJX7m38iExJ_ntGv4_Ip8VTa-an8gBwBo)]( https://g.codefresh.io/pipelines/edit/new/builds?id=607e25e6728f5a6fba30431b&pipeline=test-compatibility&projects=terraform-modules&projectId=607db54b728f5a5f8930405d)

A Terraform Module to integrate Google Artifact Registry (GAR) with Lacework.

:warning: - **NOTE:** When using an existing Service Account, Terraform cannot work out whether a role has already been applied.
This means when running the destroy step, existing roles may be removed from the Service Account. If this Service Account
is managed by another Terraform module, you can re-run apply on the other module and this will re-add the role. 

Alternatively, it is possible to remove the offending roles from the state file before destroy, preventing the role(s) 
from being removed. 

e.g. `terraform state rm 'google_project_iam_member.for_gar_integration'`

**TODO:**  Update and Verify Example Scripts

## Required Roles
```
roles/artifactRegistry.reader
```

## Required APIs
```
cloudresourcemanager.googleapis.com
artifactregistry.googleapis.com
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.26 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 3.0 |
| <a name="requirement_lacework"></a> [lacework](#requirement\_lacework) | >= 0.9.2 |
| <a name="requirement_time"></a> [time](#requirement\_time) | ~> 0.6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | ~> 3.0 |
| <a name="provider_lacework"></a> [lacework](#provider\_lacework) | >= 0.9.2 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |
| <a name="provider_time"></a> [time](#provider\_time) | ~> 0.6 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_lacework_gar_svc_account"></a> [lacework\_gar\_svc\_account](#module\_lacework\_gar\_svc\_account) | lacework/service-account/gcp | ~> 1.0 |

## Resources

| Name | Type |
|------|------|
| [google_project_iam_member.for_gar_integration](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_service.required_apis_for_gar_integration](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [lacework_integration_gar.default](https://registry.terraform.io/providers/lacework/lacework/latest/docs/resources/integration_gar) | resource |
| [random_id.uniq](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [time_sleep.wait_time](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [google_project.selected](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_lacework_integration_name"></a> [lacework\_integration\_name](#input\_lacework\_integration\_name) | The integration name displayed in the Lacework UI. | `string` | `"TF GAR"` | no |
| <a name="input_limit_by_label"></a> [limit\_by\_label](#input\_limit\_by\_label) | An image label to limit the assessment of images with matching label. If you specify limit\_by\_tag and limit\_by\_label limits, they function as an AND.  Input is "key" = "value" | `list(any)` | <pre>[<br>  {<br>    "": ""<br>  }<br>]</pre> | no |
| <a name="input_limit_by_repositories"></a> [limit\_by\_repositories](#input\_limit\_by\_repositories) | A comma-separated list of repositories to assess. This should be defined as a string. (without spaces recommended) | `list(any)` | `[]` | no |
| <a name="input_limit_by_tags"></a> [limit\_by\_tags](#input\_limit\_by\_tags) | An image tag to limit the assessment of images with matching tag. If you specify limit\_by\_tag and limit\_by\_label limits, they function as an AND. Supported field input are mytext*mytext, mytext, mytext*, or mytext. Only one * wildcard is supported | `list(any)` | `[]` | no |
| <a name="input_limit_num_imgs"></a> [limit\_num\_imgs](#input\_limit\_num\_imgs) | The maximum number of newest container images to assess per repository. Must be one of 5, 10, or 15. | `string` | `"5"` | no |
| <a name="input_non_os_package_support"></a> [non\_os\_package\_support](#input\_non\_os\_package\_support) | Whether or not the integration should check non-os packages in the container for vulnerabilities | `bool` | `true` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | The prefix that will be use at the beginning of every generated resource | `string` | `"lw-gar"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | A project ID different from the default defined inside the provider | `string` | `""` | no |
| <a name="input_registry_domain"></a> [registry\_domain](#input\_registry\_domain) | The GAR domain, which specifies the location where you store the images. Supported domains should follow the format of (region\|zone)-docker.pkg.dev | `string` | `"us-docker.pkg.dev"` | no |
| <a name="input_required_gar_apis"></a> [required\_gar\_apis](#input\_required\_gar\_apis) | n/a | `map(any)` | <pre>{<br>  "artifactregistry": "artifactregistry.googleapis.com",<br>  "resourcemanager": "cloudresourcemanager.googleapis.com"<br>}</pre> | no |
| <a name="input_service_account_name"></a> [service\_account\_name](#input\_service\_account\_name) | The Service Account name (required when use\_existing\_service\_account is set to true). This can also be used to specify the new service account name when use\_existing\_service\_account is set to false | `string` | `""` | no |
| <a name="input_service_account_private_key"></a> [service\_account\_private\_key](#input\_service\_account\_private\_key) | The private key in JSON format, base64 encoded (required when use\_existing\_service\_account is set to true) | `string` | `""` | no |
| <a name="input_use_existing_service_account"></a> [use\_existing\_service\_account](#input\_use\_existing\_service\_account) | Set this to true to use an existing Service Account. When using an existing service account, the required roles must be added manually. | `bool` | `false` | no |
| <a name="input_wait_time"></a> [wait\_time](#input\_wait\_time) | Amount of time to wait before the next resource is provisioned. | `string` | `"10s"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_account_name"></a> [service\_account\_name](#output\_service\_account\_name) | The Service Account name created for the integration |
| <a name="output_service_account_private_key"></a> [service\_account\_private\_key](#output\_service\_account\_private\_key) | The private key in JSON format, base64 encoded |
