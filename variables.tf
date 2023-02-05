
# variable for aws region
variable "AWS_REGION" {}

# variable for access key
variable "AWS_ACCESS_KEY_ID" {
  description = "aws access key id value"
  type        = string
}

# variable for secret key
variable "AWS_SECRET_ACCESS_KEY" {
  description = "aws secret access key value"
  type        = string
}

# variable for ubuntu version
variable "IMAGE" {}

# variable to hold vpc id
variable "VPC_ID" {}

# variable for instance type
variable "INSTANCE" {}

# key pair variable for bastion
# variable "KEY_PAIR" {}

# key pair variable for api
variable "API_KEY_PAIR" {}

# key pair variable for app
variable "APP_KEY_PAIR" {}

variable "BASTION_KEY_PAIR" {}

# variable for my ip address
variable "MY_IP" {
  description = "my ip address"
  type        = string

}

# variable for app ip address
# variable "APP-IP" {
#   description = "react app ip address"
#   type        = string

# }

# variable setting the vpc cidr blocks
variable "VPC_CIDR" {
  description = "CIDR block for VPC"
  type        = string
}

# variable setting the public subnet cidr blocks for public subnet 1
variable "PUB_SUB_CIDR" {
  description = "public subnet 1 cidr blocks"
  type        = string
}

# variable setting the public subnet cidr blocks for public subnet 2
variable "PUB_SUB_2_CIDR" {
  description = "public subnet 2 cidr blocks"
  type        = string
}

# variable setting the public subnet cidr blocks for public subnet 2
variable "PUB_SUB_3_CIDR" {
  description = "public subnet 3 cidr blocks"
  type        = string
}

# variable setting the private subnet cidr blocks
variable "PRI_SUB_CIDR_1" {
  description = "private subnet 1 cidr blocks"
  type        = string
}

variable "PRI_SUB_CIDR_2" {
  description = "private subnet 2 cidr blocks"
  type        = string
}

variable "FP_IG_ROUTE_CIDR" {
  description = "route table route to internet gateway cidr block"
  type        = string
}

variable "DB_PASSWORD" {
  description = "database password"
  type        = string
}

variable "DB_USERNAME" {
  description = "database user"
  type        = string
}

variable "DB" {
  description = "database"
  type        = string
}

variable "HOST" {
  description = "database host"
  type        = string
}

variable "API_IP" {
  description = "ip address of api"
  type        = string
}

variable "BUCKET_NAME" {
  description = "bucket name"
  type        = string
}

variable "ACL_VALUE" {
  description = "acl value"
  type        = string
}

variable "DYN_NAME" {
  description = "dynamoDB name"
  type        = string
}

variable "DYN_HASH" {
  description = "dynamoDB hash-key"
  type        = string
}

variable "DYN_HASH_TYPE" {
  description = "dynamoDB hash-key type"
  type        = string
}

# variable "PRI_SUB_1_ID" {
#   description = "private subnet 1 id"
#   type        = string
# }

# variable "PRI_SUB_2_ID" {
#   description = "private subnet 2 id"
#   type        = string
# }