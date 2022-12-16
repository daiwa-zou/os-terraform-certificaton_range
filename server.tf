#hosts in workstations_subnet
resource "openstack_compute_instance_v2" "create_windows_server_2012_in_services"{
  depends_on = [
    openstack_networking_subnet_v2.cert_main_internal_services_subnet
  ]
  count = 2
  name = "windows_server_2012-${count.index+1}"
  #key_pair = ""
  security_groups = ["default"]
  flavor_id = var.flavor_ids.medium
  # user_data = file("${path.module}/external/user_data/cloudbaseinit-example.con
      timeouts {
    create = "60m"
  }
  network {
    uuid = openstack_networking_subnet_v2.cert_main_internal_services_subnet
  }
  block_device {
    source_type = "image"
    uuid = var.image_ids.windows_2k12_cloud
    delete_on_termination = true
    boot_index = 0
    destination_type = "volume"
    volume_size = 20
  }
}