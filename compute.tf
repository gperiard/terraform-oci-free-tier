data "http" "ssh_authorized_keys" {
  url    = local.ssh_key_url
  method = "GET"
}

data "oci_core_images" "ubuntu" {
  compartment_id   = oci_identity_compartment.general.id
  operating_system = "Ubuntu"
}

resource "oci_core_instance" "cloud_00" {
  availability_domain = local.availability_domain
  compartment_id      = oci_identity_compartment.general.id
  shape               = local.instance_shape
  display_name        = "cloud-01"

  metadata = {
    ssh_authorized_keys = data.http.ssh_authorized_keys.response_body
  }

  shape_config {
    ocpus         = 2
    memory_in_gbs = 12
  }

  source_details {
    source_id   = local.instance_source_id
    source_type = "image"
  }

  create_vnic_details {
    subnet_id        = module.vcn.subnet_id.compute
    nsg_ids          = [oci_core_network_security_group.default.id]
    assign_public_ip = true
  }
}
