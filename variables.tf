variable "bucket_name" {
  description = "The name of the S3 bucket. Must be globally unique."
  type        = string
  default = "bsm-deploy-static-state"
}

variable "table_name" {
  description = "The name of the DynamoDB table. Must be unique in this AWS account."
  type        = string
  default = "bsm-deploy-static-locks"

}

variable "aws_region" {
  description = "The AWS region"
  type        = string
  default     = "us-east-2"
}

variable "aws_access_key_id" {
  description = "AWS Access Key ID"
  type        = string
}

variable "aws_secret_access_key" {
  description = "AWS Secret Access Key"
  type        = string
}

variable "bucket_prefix" {
  description = "Prefix for S3 bucket"
  type        = string
  default     = "random-bsm"
}



variable "index_document" {
  description = "The index document of the website"
  type        = string
  default     = "index.html"
}

variable "error_document" {
  description = "The error document of the website"
  type        = string
  default     = "error.html"
}

variable "html_source_dir" {
  description = "Directory path for HTML source files"
  type        = string
  default     = "../../static/html/"
}
