# Configure the Lacework GAR integration

This example shows how create a configured Google Artifact Registry integration with Lacework.

The fields required for this example are:

| Name | Description | Type |
|------|-------------|------|
| `lacework_integration_name` | Set this to whatever you would like the integration to be named. | `string` |
| `registry_domain` | The GAR domain, which specifies the location where you store the images. Defaults to us-docker.pkg.dev| `string` |
| `limit_by_tags` | An image tag to limit the assessment of images with matching tag. If you specify limit_by_tag and limit_by_label limits, they function as an AND. Supported field input are mytext\*mytext, mytext, mytext\*, or mytext. Only one \* wildcard is supported. Defaults to \*. | `string` |
| `limit_by_label` | An image label to limit the assessment of images with matching label. If you specify limit_by_tag and limit_by_label limits, they function as an AND. Supported field input are mytext\*mytext, mytext, mytext\*, or mytext. Only one \* wildcard is supported. Defaults to \*. | `string` |
| `limit_by_repositories` | A comma-separated list of repositories to assess. This should be defined as a string. (without spaces recommended) | `string` |
| `limit_num_imgs` | The maximum number of newest container images to assess per repository. Must be one of 5, 10, or 15. Defaults to 5. | `string` |
|`non_os_packages` | Whether or not Lacework should scan container images for additional application librarys beyond OS packages | `boolean`|


Create a `main.tf` with the following code:

```hcl
provider "google" {}

provider "lacework" {}

module "lacework_gar" {

  lacework_integration_name = "Example GAR integration"
  registry_domain           = "us-docker.pkg.dev"
  limit_by_tags             = ["example*"]
  limit_by_label            = ["example*"]
  limit_by_repositories     = ["foo","bar"]
  limit_num_imgs            = "10"
  non_os_packages           = true
}
```

Run Terraform:
```
$ terraform init
$ GOOGLE_CREDENTIALS=account.json GOOGLE_PROJECT=my-project terraform apply
```

For detailed information on integrating Lacework with Google Artifact Registry see [Integrate Google Artifact Registry](https://support.lacework.com/hc/en-us/articles/1500009169561-Integrate-Google-Artifact-Registry)
