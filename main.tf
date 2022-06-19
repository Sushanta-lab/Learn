provider "aws" {
     access_key = "AKIATGWG6QMMIMYCAAMJ"
     secret_key = "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"	
     region = "us-east-2"
}

resource "aws_vpc" "myvpc" {
        cidr_block = "10.0.0.0/26"
        instance_tenancy = "default"

    tags = {
      Name = "myvpc"
  }
}

resource "aws_subnet" "mysubnet" {
        vpc_id = aws_vpc.myvpc.id
        cidr_block = "10.0.0.0/28"

    tags = {
      Name = "mysubnet"
  }
}

resource "aws_internet_gateway" "igw" {
        vpc_id = aws_vpc.myvpc.id

    tags = {
      Name = "igw"
  }
}

