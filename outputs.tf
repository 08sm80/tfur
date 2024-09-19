
output "vpc1_sn2" {
  value = data.google_compute_network.vpc1.subnetworks_self_links

}
