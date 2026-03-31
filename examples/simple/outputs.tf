output "topic_id" {
  description = "The fully-qualified ID of the Pub/Sub topic."
  value       = module.pubsub_topic.topic_id
}

output "topic_name" {
  description = "The short name of the Pub/Sub topic."
  value       = module.pubsub_topic.topic_name
}

output "notification_channel_id" {
  description = "The fully-qualified ID of the GCP Monitoring notification channel."
  value       = module.pubsub_topic.notification_channel_id
}

output "notification_channel_name" {
  description = "The resource name of the GCP Monitoring notification channel."
  value       = module.pubsub_topic.notification_channel_name
}
