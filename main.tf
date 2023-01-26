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
    access_key  = var.AWS_ACCESS_KEY_ID
    secret_key = var.AWS_SECRET_ACCESS_KEY
}



# ec2 instances

# module calls for bastion host, ec2-pi and ec2-app instances
module ec2-bastion {
    source = "./modules/ec2-bastion"
    user-data = "${file("./data/psql_install.sh")}"
    subnet-id = module.public_1.public-1-id
    sg-id = module.sg_bastion.sg-bastion-id
    image = var.IMAGE
}

module ec2-api {
    source = "./modules/ec2-api"
    user-data = templatefile("./data/fp_api.sh",{ db="${var.DB}", host="${var.HOST}", password="${var.DB_PASSWORD}", user="${var.DB_USERNAME}" } )
    subnet-id = module.public_2.public-2-id
    sg-id = module.sg_api.sg-api-id
    image = var.IMAGE
    key-pair = var.API_KEY_PAIR
}

module ec2-app {
    source = "./modules/ec2-app"
    user-data = templatefile("./data/fp_app.sh", {api-ip="${var.API_IP}"})
    subnet-id = module.public_3.public-3-id
    sg-id = module.sg_app.sg-app-id
    image = var.IMAGE
    key-pair = var.APP_KEY_PAIR
}


# rds database

module db {
    source = "./modules/db"
    private-1 = module.private.private-subnet-1-id
    private-2 = module.private.private-subnet-2-id
    rds-sg = module.sg_db.sg-rds-id
    rds-password = var.DB_PASSWORD
    user = var.DB_USERNAME
}

# security groups

module sg_bastion {
    source = "./modules/security-groups/sg_bastion"
    vpc-id = module.vpc.vpc-id
    my-ip = var.MY_IP
}

module sg_api {
    source = "./modules/security-groups/sg_api"
    vpc-id = module.vpc.vpc-id
    my-ip = var.MY_IP
    app = module.sg_app.sg-app-id
    app-ip = var.APP-IP
}

module sg_app {
    source = "./modules/security-groups/sg_app"
    vpc-id = module.vpc.vpc-id
    my-ip = var.MY_IP
}

module sg_db {
    source = "./modules/security-groups/sg_db"
    vpc-id = module.vpc.vpc-id
    bastion = module.sg_bastion.sg-bastion-id
    api = module.sg_api.sg-api-id
}

module public_1 {
    source = "./modules/subnets/public_1"
    vpc-id = module.vpc.vpc-id
    cidr-pub-1 = var.PUB_SUB_CIDR
}

module public_2 {
    source = "./modules/subnets/public_2"
    vpc-id = module.vpc.vpc-id
    cidr-pub-2 = var.PUB_SUB_2_CIDR
}

module public_3 {
    source = "./modules/subnets/public_3"
    vpc-id = module.vpc.vpc-id
    cidr-pub-3 = var.PUB_SUB_3_CIDR
}

module private {
    source = "./modules/subnets/private"
    vpc-id = module.vpc.vpc-id
    cidr-pri-1 = var.PRI_SUB_CIDR_1
    cidr-pri-2 = var.PRI_SUB_CIDR_2

}

module vpc {
    source = "./modules/vpc"
    private-subnet-1-id = module.private.private-subnet-1-id
    private-subnet-2-id = module.private.private-subnet-2-id
    vpc-cidr = var.VPC_CIDR
    fp-ig-route-cidr = var.FP_IG_ROUTE_CIDR
}

module s3 {
    source = "./modules/s3"
    bucket-name = var.BUCKET_NAME
    acl-value = var.ACL_VALUE
    dynamo-name = var.DYN_NAME
    dynamo-hash = var.DYN_HASH
    dynamo-hash-type = var.DYN_HASH_TYPE
    region = var.AWS_REGION
}







