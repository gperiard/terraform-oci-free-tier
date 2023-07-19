locals {
  availability_domain = "aePf:CA-MONTREAL-1-AD-1"
  ssh_key_url         = "https://github.com/<your github username>.keys"
  instance_shape      = "VM.Standard.A1.Flex"
  instance_source_id  = "ocid1.image.oc1.ca-montreal-1.aaaaaaaaxdfjw2kkkce2blsip4vruw47f6x6yo7gqgywccfmsyb3yjukjgva"

  compartment_name         = "<name it>"
  compartement_description = "<describe it>"

  vcn_dns_label     = "cloud"
  vcn_display_name  = "<name it>"
  is_ipv6enabled    = true
  region_identifier = "ca-montreal-1"
  vcn_cidr_blocks = [
    "192.168.4.0/24",
  ]
  vnc_subnets = {
    "compute" = {
      cidr_block = "192.168.4.0/25"
      type       = "public"
    }
  }
}