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

# access secrets

resource "google_project_iam_member" "function_secret_access" {
  project = "devops-374804"
  role    = "roles/secretmanager.secretAccessor"
  member  = "serviceAccount:${google_cloudfunctions_function.hello_world.service_account_email}"
