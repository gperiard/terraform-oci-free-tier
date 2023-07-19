resource "oci_identity_compartment" "root" {
  description = local.compartement_description
  name        = local.compartment_name
}

resource "oci_identity_compartment" "general" {
  compartment_id = oci_identity_compartment.root.id
  description    = "General compartment cloud"
  name           = "cloud"
}