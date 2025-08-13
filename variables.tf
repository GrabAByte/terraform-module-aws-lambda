variable "bucket_arn" {
  type        = string
  description = "The s3 bucket arn to upload to"
  default     = null
}

variable "dynamodb_table_arn" {
  type        = string
  description = "The ARN of the dynamo DB table"
  default     = null
}

variable "enable_logging" {
  type        = bool
  description = "Whether to send logs to Cloudwatch"
  default     = true
}

variable "environment" {
  type        = map(any)
  description = "A map of lambda environment variables"
  default     = {}
}

variable "function_name" {
  type        = string
  description = "The Lambda function name"
}

variable "handler" {
  type        = string
  description = "The lambda handler"
}

variable "iam_role_name" {
  type        = string
  description = "The name of the IAM Role to assign the policy to"
}

variable "api_integration" {
  type        = bool
  description = "Is lambda integrated to API Gateway"
  default     = false
}

variable "s3_integration" {
  type        = bool
  description = "Is lambda integrated to S3"
  default     = false
}

variable "dynamodb_integration" {
  type        = bool
  description = "Is lambda integrated to Dynamo DB"
  default     = false
}

variable "lambda_source" {
  type        = string
  description = "The source file for the lambda function"
}

variable "lambda_filename" {
  type        = string
  description = "The lambda filename"
}

variable "logging_config" {
  description = "Logging configuration for the Lambda function"
  type = object({
    log_format       = string
    system_log_level = string
  })
  default = {
    log_format       = "JSON"
    system_log_level = "DEBUG"
  }
}

variable "runtime" {
  type        = string
  description = "The lambda runtime"
}

variable "security_groups" {
  type        = string
  description = "The security group(s) to attach the lambda to"
}

variable "tags" {
  type        = map(any)
  description = "The project tags"
}

variable "timeout" {
  type        = number
  description = "The lambda timeouot duration"
  default     = 10
}

variable "tracing_mode" {
  type        = string
  description = "To set x-ray tracing mode"
  default     = "Active"
}

variable "vpc_subnet_0" {
  type        = string
  description = "The VPC subnet(s) to deploy the lambda into"
}

variable "vpc_subnet_1" {
  type        = string
  description = "The VPC subnet(s) to deploy the lambda into"
}
