resource "aws_instance" "catalogue" {
  ami           = local.ami_id
  vpc_security_group_ids = [local.catalogue_sg_id]
  instance_type = "t3.micro"
  subnet_id = local.private_subnet_id

  tags = merge(
    local.common_tags,
    {
        Name = "${local.common_name_suffix}-catalogue"
    }
  )
}
resource "terraform_data" "catalogue" {
  triggers_replace = [
    aws_instance.catalogue.id,
  ]
  connection {
    type        = "ssh"
    user        = "ec2-user" # Or appropriate user for your AMI
    password    = "DevOps321"
    host        = aws_instance.catalogue.private_ip
  }

    provisioner "file" {
    source      = "catalogue.sh"
    destination = "/tmp/catalogue.sh" # Path to the destination on the EC2 instance

   }
  
  provisioner "remote-exec" {
    inline = [
        "chmod +x /tmp/catalogue.sh",
         #"sudo sh /tmp/bootstrap.sh"
        "sudo sh /tmp/catalogue.sh catalogue ${var.environment}"
    ]
  }
}
resource "aws_ec2_instance_state" "catalogue" {
  instance_id = aws_instance.catalogue.id
  state       = "stopped"
  depends_on = [terraform_data.catalogue]
}

resource "aws_ami_from_instance" "example" {
  name               = "${local.common_name_suffix}-catalogue-ami"
  source_instance_id = aws_instance.catalogue.id
  depends_on = [aws_ec2_instance_state.catalogue]
}
