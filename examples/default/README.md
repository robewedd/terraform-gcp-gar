# Default Lacework GAR Integration

This example creates a new least privilege service account to access the Google Artifact Registry of the project configured in the automationan and integrates it with Lacework.

```hcl
terraform {
  required_providers {
    lacework = {
      source = "lacework/lacework"
    }
  }
}

provider "lacework" {}

provider "google" {}

module "lacework_gar" {
  source    = "lacework/gar/gcp"
  version   = "~> 0.1"
}
```

For detailed information on integrating Lacework with Google Artifact Registry see [Integrate Google Artifact Registry](https://support.lacework.com/hc/en-us/articles/1500009169561-Integrate-Google-Artifact-Registry)

