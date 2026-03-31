# terraform-google-pubsub-topic

A Terraform module for creating a Pub/Sub topic with GCP Monitoring notification channel integration and IAM bindings.

## Features

- Create Pub/Sub topic for monitoring alerts
- Automatic GCP Monitoring notification channel creation
- IAM binding for GCP Monitoring service account
- Configurable message retention
- Ready for alert policy integration

---

## Assumptions

The project assumes the following:

- A basic understanding of [Git](https://git-scm.com/).
- Git version `>= 2.33.0`.
- An existing GCP IAM user or role with access to create/update/delete resources defined in [main.tf](https://github.com/nurdsoft/terraform-google-pubsub-topic/blob/main/main.tf).
- [GCloud CLI](https://cloud.google.com/sdk/docs/install) `>= 465.0.0`.
- A basic understanding of [Terraform](https://www.terraform.io/).
- Terraform version `>= 1.3.0`.
- (Optional - for local testing) A basic understanding of [Make](https://www.gnu.org/software/make/manual/make.html#Introduction).
  - Make version `>= GNU Make 3.81`.
  - **Important Note**: This project includes a [Makefile](https://github.com/nurdsoft/terraform-google-pubsub-topic/blob/main/Makefile) to speed up local development in Terraform. The `make` targets act as a wrapper around Terraform commands. As such, `make` has only been tested/verified on **Linux/Mac OS**. Though, it is possible to [install make using Chocolatey](https://community.chocolatey.org/packages/make), we **do not** guarantee this approach as it has not been tested/verified. You may use the commands in the [Makefile](https://github.com/nurdsoft/terraform-google-pubsub-topic/blob/main/Makefile) as a guide to run each Terraform command locally on Windows.

---

## Test

**Important Note**: This project includes a [Makefile](https://github.com/nurdsoft/terraform-google-pubsub-topic/blob/main/Makefile) to speed up local development in Terraform. The `make` targets act as a wrapper around Terraform commands. As such, `make` has only been tested/verified on **Linux/Mac OS**. Though, it is possible to [install make using Chocolatey](https://community.chocolatey.org/packages/make), we **do not** guarantee this approach as it has not been tested/verified. You may use the commands in the [Makefile](https://github.com/nurdsoft/terraform-google-pubsub-topic/blob/main/Makefile) as a guide to run each Terraform command locally on Windows.

```sh
gcloud init # https://cloud.google.com/docs/authentication/gcloud
gcloud auth application-default login

# Copy the example tfvars and customize it
cp examples/simple/examples.tfvars examples/simple/terraform.tfvars
# Edit terraform.tfvars with your values

# Run terraform commands
make plan SVC=simple
make apply SVC=simple
make destroy SVC=simple
```

---

## Contributions

Contributions are always welcome. As such, this project uses the `main` branch as the source of truth to track changes.

**Step 1**. Clone this project.

```sh
# Using SSH
$ git clone git@github.com:nurdsoft/terraform-google-pubsub-topic.git

# Using HTTPS
$ git clone https://github.com/nurdsoft/terraform-google-pubsub-topic.git
```

**Step 2**. Checkout a feature branch: `git checkout -b feature/abc`.

**Step 3**. Validate the change/s locally by executing the steps defined under [Test](#test).

**Step 4**. If testing is successful, commit and push the new change/s to the remote.

```sh
$ git add file1 file2 ...

$ git commit -m "Adding some change"

$ git push --set-upstream origin feature/abc
```

**Step 5**. Once pushed, create a [PR](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request) and assign it to a member for review.

- **Important Note**: It can be helpful to attach the `terraform plan` output in the PR.

**Step 6**. A team member reviews/approves/merges the change/s.

**Step 7**. Once merged, deploy the required changes as needed.

**Step 8**. Once deployed, verify that the changes have been deployed.

- If possible, please add a `plan` output using the feature branch so the member reviewing the PR has better visibility into the changes.

---

## Usage

```hcl
module "pubsub_topic" {
  source = "git::https://github.com/nurdsoft/terraform-google-pubsub-topic.git?ref=main"

  project_id = "my-project"
  topic_name = "monitoring-alerts"
}
```

## Resources Created

The module provisions the following resources:

| Resource | Description |
|---|---|
| `google_pubsub_topic` | The Pub/Sub topic that receives alert payloads from GCP Monitoring |
| `google_monitoring_notification_channel` | A GCP Monitoring notification channel of type `pubsub` pointing to the topic |
| `google_pubsub_topic_iam_member` | Grants `roles/pubsub.publisher` to the GCP Monitoring service account so it can publish alerts to the topic |

## Examples

| Example | Description |
|---|---|
| [simple](./examples/simple) | Create a Pub/Sub topic with monitoring notification channel |

## Requirements

| Name | Version |
|---|---|
| terraform | >= 1.3 |
| google | >= 5.0 |

## Providers

| Name | Version |
|---|---|
| [google](https://registry.terraform.io/providers/hashicorp/google/latest) | >= 5.0 |

## Inputs

### Required

| Name | Description | Type | Default | Required |
|---|---|---|---|---|
| `project_id` | The GCP project ID to deploy resources into | `string` | n/a | yes |

### Optional

| Name | Description | Type | Default | Required |
|---|---|---|---|---|
| `topic_name` | The name of the Pub/Sub topic that receives GCP Monitoring alert notifications | `string` | `"monitoring-alerts"` | no |
| `message_retention_duration` | How long to retain unacknowledged messages in the topic (e.g. "86400s" for 1 day) | `string` | `"86400s"` | no |
| `notification_channel_display_name` | Display name for the GCP Monitoring notification channel that publishes alerts to the Pub/Sub topic | `string` | `"Monitoring Alerts Pub/Sub Channel"` | no |
| `monitoring_publisher_role` | The IAM role granted to the GCP Monitoring service account to allow it to publish alert messages to the Pub/Sub topic | `string` | `"roles/pubsub.publisher"` | no |

## Outputs

| Name | Description |
|---|---|
| `topic_id` | The fully-qualified ID of the Pub/Sub topic (e.g. projects/my-project/topics/my-topic) |
| `topic_name` | The short name of the Pub/Sub topic |
| `notification_channel_id` | The fully-qualified ID of the GCP Monitoring notification channel |
| `notification_channel_name` | The resource name of the GCP Monitoring notification channel. Pass this as notification_channels to the alert-policies module |

## Authors

Module is maintained by [Nurdsoft](https://github.com/nurdsoft).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/nurdsoft/terraform-google-pubsub-topic/blob/main/LICENSE) for full details.
