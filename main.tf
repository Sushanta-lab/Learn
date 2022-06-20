provider "aws" {
     access_key = "AKIASZOZACHZU3Y3V4UD"
     secret_key = "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"	
     region = "eu-central-1"
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

resource "aws_internet_gateway" "myigw" {
        vpc_id = aws_vpc.myvpc.id

    tags = {
      Name = "igw"
  }
}
