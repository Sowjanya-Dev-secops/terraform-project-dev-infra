# data "aws_ami" "ami_instance" {
  
#   owners           = ["668183236892"]
#   most_recent      = true
#   filter {
#     name   = "name"
#     values = ["Redhat-9-DevOps-Practice*"]
#   }

#   filter {
#     name   = "root-device-type"
#     values = ["ebs"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
# }

data "aws_ami" "ami_instance" {
  most_recent = true
  owners      = ["973714476881"]   # ✅ correct owner account

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}


data "aws_ssm_parameter" "bastion_sg_id" {
  name = "/${var.project_name}/${var.environment}/bastion_sg_id"
}
data "aws_ssm_parameter" "public_subnet_ids" {
  name = "/${var.project_name}/${var.environment}/public_subnet_ids"
}