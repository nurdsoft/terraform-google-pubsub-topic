# -----------------------------------------------------------------------------
# Example: Pub/Sub Topic
# This example shows the minimal setup to use the pubsub-topic module.
# It creates a Pub/Sub topic, a GCP Monitoring notification channel pointing to that topic, and the required IAM binding so GCP Monitoring can publish alert messages to the topic.
# -----------------------------------------------------------------------------
module "pubsub_topic" {
  source = "git::https://github.com/nurdsoft/terraform-google-pubsub-topic.git?ref=v1.0.0"

  project_id                        = var.project_id
  topic_name                        = var.topic_name
  message_retention_duration        = var.message_retention_duration
  notification_channel_display_name = var.notification_channel_display_name
  monitoring_publisher_role         = var.monitoring_publisher_role
}
