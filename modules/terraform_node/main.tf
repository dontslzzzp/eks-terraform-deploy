resource "aws_instance" "terraform_node" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  user_data     = file("${path.module}/userdata.sh")
  disable_api_termination = true
  disable_api_stop       = true
  
  lifecycle {
    ignore_changes = [
      instance_state,
    ]
  }

  tags = {
    Name = "terraform_node"
  }
}
