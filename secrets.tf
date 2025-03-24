resource "google_secret_manager_secret" "api_key_secret" {
  secret_id = "api-key"
  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "api_key_secret_version" {
  secret     = google_secret_manager_secret.api_key_secret.id
  secret_data = "Key.json"
}
