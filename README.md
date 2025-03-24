The Terraform module handles the deployment of Cloud Functions (Gen 2) on GCP.

The resources/services/activations/deletions that this module will create/trigger are:

Deploy Cloud Functions (2nd Gen) with provided source code and trigger
Provide Cloud Functions Invoker or Developer roles to the users and service accounts


This module assumes that below mentioned prerequisites are in place before consuming the module.

APIs are enabled
Permissions are available.
You have explicitly granted the necessary IAM roles for the underlying service account used by Cloud Build, build_service_account. If build_service_account is not specified, then the default compute service account is used, which has no default IAM roles in new organizations. At a minimum, the following IAM roles are required for the build service account:
roles/logging.logWriter
roles/storage.objectViewer
roles/artifactregistry.writer


APIs
A project with the following APIs enabled must be used to host the resources of this module:

Google Cloud Storage JSON API: storage-api.googleapis.com
Cloud Functions API: cloudfunctions.googleapis.com
Cloud Run Admin API: run.googleapis.com
Cloud Build API: cloudbuild.googleapis.com
Artifact Registry API: artifactregistry.googleapis.com
Pub/Sub API: pubsub.googleapis.com
Secret Manager API: secretmanager.googleapis.com
EventArc API: eventarc.googleapis.com
The Project Factory module can be used to provision a project with the necessary APIs enabled.



terraform init
terraform plan
terraform apply
