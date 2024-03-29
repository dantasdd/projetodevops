resource "google_compute_instance" "default" {
name = "mongodb-eotica-elens"
machine_type = "n1-standard-1"
zone = "us-east1-b"
tags = ["foo", "bar"]
boot_disk {
initialize_params {
image = "centos-7-v20190813"
}
}
// Local SSD disk
scratch_disk {
}
network_interface {
network = "default"
access_config {
// Ephemeral IP
}
}
metadata = {
foo = "bar"
}
metadata_startup_script = "echo hi > /test.txt"
service_account {
scopes = ["userinfo-email", "compute-ro", "storage-ro"]
}
}

