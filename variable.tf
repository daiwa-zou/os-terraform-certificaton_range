#Debugging
#OS_DEBUG=1
#TF_LOG=DEBUG

variable tenant_name {
  type = string
  default = "certification_range"
}
variable project_domain_name {
  type = string
  default = "Default"
}

#map variable to store project ids
variable "project_ids" {
  type = map(string)
  default = {
    certification_range     = "0055143451ce4360b4068ad9f571bd41"
    administration          = "0055143451ce4360b4068ad9f571bd41"
  }
}

#map variables to store image ids
variable "image_ids" {
  type = map(string)
  default = {
    windows_10_cloud      = "c53182dd-931c-45cd-9d7c-8ddd863fe7a4"
    windows_2k19_cloud    = "905521f6-f30d-4020-81ce-622f364c13f4"
    windows_2k12_cloud    = "adcf68d5-4fc0-4329-8f15-d1d76264c701"
  }
}

#string variable for network_id for external_public_network
variable "external_public_network" {
  type = string
  default = "0dd26763-44f5-44ed-b13d-90916ac0cb66"
}

#map variable to store flavor ids
variable "flavor_ids" {
  type = map(string)
  default = {
    tiny = "52b8c532-1e99-4675-a54f-af13a52b1566"         #1_VCPU,512MB_RAM,1GB_ROOT
    small = "5d07c05d-413e-4e20-bd58-8223796a565a"        #1_VCPU,2GB_RAM,20GB_ROOT
    medium = "f8d87f6f-5f88-4f70-8a2f-7fa962de857c"       #2_VCPU,4GB_RAM,40GB_ROOT
    large = "b3a67977-8190-4082-8f7d-275c4d3ea3c5"        #4_VCPU,8GB_RAM,80GB_ROOT
    xlarge = "0f27df78-1e3c-46e0-a6ce-778a05d67192"       #8_VCPU,16GB_RAM,160GB_ROOT
    xxlarge = "e6c34525-b53c-4c06-977c-ff95ba33d211"      #16-VCPU,32GB_RAM,320GB_ROOT
  }
}
