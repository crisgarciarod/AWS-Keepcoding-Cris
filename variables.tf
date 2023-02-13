variable "region" {
  default = "eu-west-1"
  description = "Region en la que se ha creado el proyecto"
}

variable "bucket" {
  default = "myprojectaws"
  description = "Nombre del bucket"
}

variable "policy_enabled" {
  default = true
  description = "Habilita la politica de acceso publico al bucket, en caso de ser false se habilitan las ACL como public read, si es true, las ACL son private pero se habilita el acceso a través de policy"
}
