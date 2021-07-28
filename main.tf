provider "aws" {
     access_key = "AKIATGWG6QMML5LLIWFF"
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
