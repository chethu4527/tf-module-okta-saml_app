/* 
    These are the variables that you are going to use as inputs to the module. They will go
    inside the module stanza declaration. Some common types include string, number and bool. You can also
    create lists of these types like list(string). See https://www.terraform.io/docs/language/values/variables.html for
    the complete documentation around valid variable declaration 
*/

variable "appname" {
  description = "Application name for okta SSO Configuration"
  type        = string
  default     = null
}


variable "sso_url" {
  description = "SAML Application SSO URL"
  type        = string
  default     = null
}

variable "recipient" {
  description = "SAML Application recipient URL"
  type        = string
  default     = null
}

variable "destination" {
  description = "SAML Application destination URL"
  type        = string
  default     = null
}

variable "audience" {
  description = "SAML Application audience URL"
  type        = string
  default     = null
}

variable "subject_name_id_template" {
  description = "SAML Application subject_name_id_template "
  type        = string
  default     = null
}

variable "subject_name_id_format" {
  description = "SAML Application subject_name_id_format "
  type        = string
  default     = null
}

variable "group_attribute_name" {
  description = "SAML Application group_attribute_name "
  type        = string
  default     = null
}

variable "group_filtertype" {
  description = "SAML Application group_filtertype "
  type        = string
  default     = null
}

variable "group_filtervalue" {
  description = "SAML Application group_filtervalue "
  type        = string
  default     = null
}

variable "user_name" {
  description = "SAML Application user_name "
  type        = string
  default     = null
}

variable "user_value" {
  description = "SAML Application user_value "
  type        = string
  default     = null
}

variable "business_type" {
  description = "Business type of OKTA tenant[B2E,B2B or B2C]"
  type        = string
  default     = null
}

variable "assignment_group" {
  description = "AD Assignment Group"
  type        = string
  default     = null
}