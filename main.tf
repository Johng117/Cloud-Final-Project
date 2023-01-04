terraform {
    required_providers {
        aws = {
            source: "hashicorp/aws",
            version: "~> 4.16"
        }
    }
    required_version = ">= 1.2.0"
}

provider "aws" {
    region = var.AWS_REGION
}

# ec2 instances

# module calls for bastion host, ec2-pi and ec2-app instances
module ec2-bastion {
    source = "./modules/ec2-bastion"
    user-data = "${file("./data/psql_install.sh")}"
    subnet-id = module.public_1.public-1-id
    sg-id = module.sg_bastion.sg-bastion-id
}

module ec2-api {
    source = "./modules/ec2-api"
    user-data = "${file("./data/fp_api.sh")}"
    subnet-id = module.public_2.public-2-id
    sg-id = module.sg_api.sg-api-id
}

# rds database

module db {
    source = "./modules/db"
    private-1 = 
    private-2 =
    rds-sg = 
}

# security groups

module sg_bastion {
    source = "./modules/security-groups/sg_bastion"
    vpc-id = module.vpc.vpc-id
}

module sg-api {
    source = "./modules/security-groups/sg_api"
    vpc-id = module.vpc.vpc-id
}

module sg-db {
    source = "./modules/security-groups/sg_db"
    vpc-id = module.vpc.vpc-id
    bastion = module.sg_bastion.sg-bastion-id
    api = module.sg-api.sg-api-id
}





module public_1 {
    source = "./modules/subnets/public_1"
    vpc-id = module.vpc.vpc-id
}











