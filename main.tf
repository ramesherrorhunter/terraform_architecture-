resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16" 
    tags = {
      name : "vpc1"
    }
}

resource "aws_subnet" "subnet1" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.1.0/28"
}

resource "aws_instance" "server1" {
    instance_type = "t2.micro"
    ami = "ami-093467ec28ae4fe03"
    subnet_id = aws_subnet.subnet1.id
    tags = {
      name : "server1"
    }
}


resource "aws_vpc" "main1" {
    cidr_block = "192.168.0.0/16" 
        tags = {
      name : "vpc2"
    }
}

resource "aws_subnet" "subnet2" {
    vpc_id = aws_vpc.main1.id
    cidr_block = "192.168.1.0/28"  
}

resource "aws_instance" "server2" {
    instance_type = "t3.nano"
    ami = "ami-093467ec28ae4fe03"
    subnet_id = aws_subnet.subnet2.id
    tags = {
      name : "server2"
    }
}

resource "aws_security_group" "sg" {
    name = "Security Group1"
    description = "Allow ssh"

    ingress {
        protocol = "tcp"
        to_port = 22
        from_port = 22
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        protocol = "-1"
        to_port = 0
        from_port = 0
        cidr_blocks = ["0.0.0.0/0"]
    }
}









