variable "namespace" {
  type        = string
  description = "Please enter desired namespace :"
}

variable "subject" {
  type        = list(object({ role = string, type = string, email_id = string, api_group = string, namespace = string }))
  description = "The Users, Groups, or ServiceAccounts to grand permissions to."
}

