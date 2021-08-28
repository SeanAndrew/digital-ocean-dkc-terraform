# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = "digital-ocean-api-key"
}

# Configure DigitalOcean kubernetes cluster
resource "digitalocean_kubernetes_cluster" "foo" {
  name   = "ltf-dkc"
  region = "nyc1"
  # Grab the latest version slug from `doctl kubernetes options versions`
  version = "1.21.2-do.2"

  node_pool {
    name       = "worker-pool"
    size       = "s-4vcpu-8gb"
    node_count = 3
  }
}
