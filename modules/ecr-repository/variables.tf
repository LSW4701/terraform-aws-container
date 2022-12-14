variable "name" {
  description = "(Required) Desired name for the repository."
  type        = string
}

variable "image_tag_immutable_enabled" {
  description = "(Optional) Enable tag immutability to prevent image tags from being overwritten by subsequent image pushes using the same tag. Disable tag immutability to allow image tags to be overwritten."
  type        = bool
  default     = false
  nullable    = false
}

variable "image_scan_on_push_enabled" {
  description = "(Optional, Deprecated) Indicates whether images are scanned after being pushed to the repository or not scanned."
  type        = bool
  default     = false
  nullable    = false
}

variable "force_delete" {
  description = "(Optional) If `true`, will delete the repository even if it contains images. Defaults to `false`."
  type        = bool
  default     = false
  nullable    = false
}

variable "encryption_type" {
  description = "(Optional) The encryption type to use for the repository. Valid values are `AES256` or `KMS`."
  type        = string
  default     = "AES256"
  nullable    = false

  validation {
    condition     = contains(["AES256", "KMS"], var.encryption_type)
    error_message = "Valid values are `AES256`, `KMS`."
  }
}

variable "encryption_kms_key" {
  description = "(Optional) The ARN of the KMS key to use when encryption_type is `KMS`. If not specified, uses the default AWS managed key for ECR."
  type        = string
  default     = null
}

variable "repository_policy" {
  description = "(Optional) The policy document for ECR Repository. This is a JSON formatted string."
  type        = string
  default     = ""
  nullable    = false
}

variable "lifecycle_rules" {
  description = "(Optional) A list of ECR Repository Lifecycle rules. `priority` must be unique and do not need to be sequential across rules. `descriptoin` is optional. `type` is one of `tagged`, `untagged`, or `any`. `tag_prefixes` is required if you specified `tagged` type. Specify one of `expiration_days` or `expiration_count`"
  type        = any
  default     = []
  nullable    = false
}

variable "tags" {
  description = "(Optional) A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}

variable "module_tags_enabled" {
  description = "(Optional) Whether to create AWS Resource Tags for the module informations."
  type        = bool
  default     = true
}


###################################################
# Resource Group
###################################################

variable "resource_group_enabled" {
  description = "(Optional) Whether to create Resource Group to find and group AWS resources which are created by this module."
  type        = bool
  default     = true
}

variable "resource_group_name" {
  description = "(Optional) The name of Resource Group. A Resource Group name can have a maximum of 127 characters, including letters, numbers, hyphens, dots, and underscores. The name cannot start with `AWS` or `aws`."
  type        = string
  default     = ""
}

variable "resource_group_description" {
  description = "(Optional) The description of Resource Group."
  type        = string
  default     = "Managed by Terraform."
}
