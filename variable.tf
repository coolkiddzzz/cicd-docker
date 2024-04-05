variable "task_definition" {
    description = "task definition"
    type        = string 
    default     = "mwaiyee-helloworld-v6:4"
}


variable "security_group" {
    description = "security group"
    type        = string 
    default     = "sg-0d27b7c2a485d0c74"
}

variable "vpc_id" {
    description = "vpc_id"
    type        = string 
    default     = "vpc-0aa58eaabb536e7d3"
}

variable "subnet1" {
    description = "subnet1"
    type        = string 
    default     = "subnet-0389c4c01e1819c52"

}

variable "subnet2" {
    description = "subnet2"
    type        = string 
    default     = "subnet-07cdfa8dcfa2dc0af"

}