  provider "google" {
  project = "devops-374804"
  region  = "us-central1"
  zone    = "us-central1-a"
}

resource "google_project_service" "functions" {
  project = "devops-374804"
  service = "cloudfunctions.googleapis.com"
}

resource "google_project_service" "compute" {
  project = "devops-374804"
  service = "compute.googleapis.com"
}

resource "google_cloudfunctions_function" "hello_world" {
  name        = "hello-world-function"
  description = "A simple Hello World Cloud Function"
  runtime     = "nodejs16"
  entry_point = "helloWorld"
  source_archive_bucket = google_storage_bucket.function_bucket.name
  source_archive_object = google_storage_bucket_object.function_archive.name
  trigger_http = true
}


resource "google_storage_bucket" "function_bucket" {
  name     = "hello-world-function-bucket"
  location = "US"
}

resource "google_storage_bucket_object" "function_archive" {
  name   = "hello-world-function.zip"
  bucket = google_storage_bucket.function_bucket.name
  source = "path_to_your_function_zip.zip"
}
