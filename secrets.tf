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

const {SecretManagerServiceClient} = require('@google-cloud/secret-manager');
const client = new SecretManagerServiceClient();

async function accessSecret() {
  const [version] = await client.accessSecretVersion({
    name: 'projects/your-project-id/secrets/api-key/versions/latest',
  });
  const apiKey = version.payload.data.toString();
  console.log(`API Key: ${apiKey}`);
