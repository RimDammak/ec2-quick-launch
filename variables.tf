variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "aws_access_key" {
  description = "AWS Access Key"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
  type        = string
  sensitive   = true
}

variable "imported_ami_id" {
  description = "AMI ID of the imported OVA or a base AMI for testing"
  type        = string
}

variable "key_name" {
  description = "EC2 Key pair name for RDP access"
  type        = string
}
