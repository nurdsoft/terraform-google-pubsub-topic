output "topic_id" {
  description = "The fully-qualified ID of the Pub/Sub topic (e.g. projects/my-project/topics/my-topic)."
  value       = google_pubsub_topic.this.id
}

output "topic_name" {
  description = "The short name of the Pub/Sub topic."
  value       = google_pubsub_topic.this.name
}

output "notification_channel_id" {
  description = "The fully-qualified ID of the GCP Monitoring notification channel."
  value       = google_monitoring_notification_channel.this.id
}

output "notification_channel_name" {
  description = "The resource name of the GCP Monitoring notification channel (e.g. projects/my-project/notificationChannels/12345). Pass this as notification_channels to the alert-policies module."
  value       = google_monitoring_notification_channel.this.name
}
