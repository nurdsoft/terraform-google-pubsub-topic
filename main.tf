data "google_project" "this" {
  project_id = var.project_id
}

resource "google_pubsub_topic" "this" {
  name                       = var.topic_name
  project                    = var.project_id
  message_retention_duration = var.message_retention_duration
}

resource "google_monitoring_notification_channel" "this" {
  display_name = var.notification_channel_display_name
  type         = "pubsub"
  project      = var.project_id

  labels = {
    topic = google_pubsub_topic.this.id
  }
}

resource "google_pubsub_topic_iam_member" "monitoring_publisher" {
  project = var.project_id
  topic   = google_pubsub_topic.this.name
  role    = var.monitoring_publisher_role
  member  = "serviceAccount:service-${data.google_project.this.number}@gcp-sa-monitoring-notification.iam.gserviceaccount.com"
}
