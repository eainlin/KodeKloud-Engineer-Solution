variable "KKE_SECRET_NAME" {
  type    = string
  default = "xfusion-app-secret-t2q5"
}

variable "KKE_SECRET_VALUE" {
  type    = string
  default = "{\"db_user\":\"admin\",\"db_pass\":\"supersecret\"}"
}

variable "KKE_ROLE_NAME" {
  type    = string
  default = "xfusion-app-role-t2q5"
}

variable "KKE_POLICY_NAME" {
  type    = string
  default = "xfusion-app-policy-t2q5"
}