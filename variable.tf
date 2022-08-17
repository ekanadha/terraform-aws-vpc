variable "vpc_name" {
   
  
}

variable "vpc_cidr" {
    #type = "number"
    #
}

variable "regionName" {}

variable "pubsubnet-1" {
   
  
}
variable "pubsubnet-2" {
   
  
}
variable "pubsubnet-3" {
   
  
}
variable "prisubnet-1" {
   
  
}
variable "prisubnet-2" {
   
  
}
variable "prisubnet-3" {
   
  
}

variable "datasubnet-1" {
    
  
}
variable "datasubnet-2" {
    
  
}
variable "datasubnet-3" {
    
  
}

variable "availability_zone" {
    type = list 
    default = []
  
}

variable "igw" {
    
  
}
variable "NAT-GW" {
    
  
}
variable "key_name-1" {
    
  
}


variable "ami" {
    
  
}


variable "type" {
    
  
}

variable "key_name" {
    
  
}

variable "appsubnet_id" {
    
  
}

variable "bastionsubnet_id" {
    
  
}

variable "web_name" {
    
  
}
variable "app_name" {
    
  
}

variable "bastion_name" {
    
  
}
variable "subnet_ids" {
    type = list 
    default = []
  
}

variable "alb_name" {
    
  
}

variable "tg_name" {
    
  
}

variable "s3_bucket_names" {
  description = "VM Names"
  #default     = "sarojini-dev-bucket"
  type        = string
}
variable "db_name" {
    
  
}

variable "mysql_name" {
    
  
}






