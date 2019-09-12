provider "google" { 
  credentials = "${file ("/root/google_cloud/terraform-key.json")}" 
  project = "my-project-aula19-06" 
  region = "us-east1" 
}
