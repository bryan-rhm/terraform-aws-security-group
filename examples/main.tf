module "sg" {
  source = "../"
  name   = "test"
  vpc_id = "vpc-012345"
  rules = [{
    type        = "ingress"
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "80"
    to_port     = "80"
    description = "HTTP Access"
  }]
}

provider "aws" {
  region = "us-east-1"
}
