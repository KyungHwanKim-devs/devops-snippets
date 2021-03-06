variable "node_roles" {
  description = "A list of ARNs of AWS IAM Roles for EKS node."
  type        = list(string)
  default     = []
}

variable "fargate_profile_roles" {
  description = "A list of ARNs of AWS IAM Roles for EKS fargate profiles."
  type        = list(string)
  default     = []
}

variable "map_roles" {
  description = "Additional mapping for IAM roles and Kubernetes RBAC."
  type = list(object({
    iam_role = string
    username = string
    groups   = list(string)
  }))
  default = []
}

variable "map_users" {
  description = "Additional mapping for IAM users and Kubernetes RBAC."
  type = list(object({
    iam_user = string
    username = string
    groups   = list(string)
  }))
  default = []
}

variable "map_accounts" {
  description = "AWS account numbers to automatically map IAM ARNs from."
  type        = list(string)
  default     = []
}
