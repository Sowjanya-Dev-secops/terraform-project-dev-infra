
variable "project_name" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

variable "sg_names" {
    default = [
        # databases
        "mongodb", "redis", "mysql", "rabbitmq",
        # backend
        "catalogue", "user", "cart", "shipping", "payment",
        # frontend
        "frontend",
        # bastion
        "bastion",
        # frontend load balancer
        "frontend_alb",
        # Backend ALB
        "backend_alb",
        "open_vpn"
    ]
}
variable "zone_id" {
  default = "Z02877213Q6KXL0HOGN3V"
}
variable "domain_name" {
  default = "msdevsecops.fun"
}
