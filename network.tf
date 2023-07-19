module "vcn" {
  source  = "oracle-terraform-modules/vcn/oci"
  version = "3.5.3"
  # insert the 5 required variables here

  # Required Inputs
  compartment_id = oci_identity_compartment.general.id
  region         = local.region_identifier

  internet_gateway_route_rules = null
  local_peering_gateways       = null
  nat_gateway_route_rules      = null

  # Optional Inputs
  vcn_name      = local.vcn_display_name
  vcn_dns_label = local.vcn_dns_label
  vcn_cidrs     = local.vcn_cidr_blocks
  enable_ipv6   = local.is_ipv6enabled

  subnets = local.vnc_subnets

  create_internet_gateway = true
  create_nat_gateway      = false
  create_service_gateway  = false
}
