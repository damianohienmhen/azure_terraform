# create network to run cluster instances

# create Kubernetes cluster, VPC, node-pools, NAT, firewall & subnet
module "network" {
  source             = "../modules/network"
}



