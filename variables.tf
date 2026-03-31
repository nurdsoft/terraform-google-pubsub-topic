# ------------------------------------------------------------------------------
# Required
# ------------------------------------------------------------------------------

variable "project_id" {
  description = "The GCP project ID to deploy resources into."
  type        = string
}

# ------------------------------------------------------------------------------
# Pub/Sub Topic
# ------------------------------------------------------------------------------

variable "topic_name" {
  description = "The name of the Pub/Sub topic that receives GCP Monitoring alert notifications."
  type        = string
  default     = "monitoring-alerts"
}

variable "message_retention_duration" {
  description = "How long to retain unacknowledged messages in the topic (e.g. \"86400s\" for 1 day)."
  type        = string
  default     = "86400s"
}

# ------------------------------------------------------------------------------
# Monitoring Notification Channel
# ------------------------------------------------------------------------------

variable "notification_channel_display_name" {
  description = "Display name for the GCP Monitoring notification channel that publishes alerts to the Pub/Sub topic."
  type        = string
  default     = "Monitoring Alerts Pub/Sub Channel"
}

# ------------------------------------------------------------------------------
# IAM
# ------------------------------------------------------------------------------

variable "monitoring_publisher_role" {
  description = "The IAM role granted to the GCP Monitoring service account to allow it to publish alert messages to the Pub/Sub topic."
  type        = string
  default     = "roles/pubsub.publisher"
}
