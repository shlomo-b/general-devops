#---------------------------------recaptcha------------------------------------#
variable "recaptcha_key" {
  type = map(object({
    project_id      = string
    display_name    = string
    allowed_domains = string
  }))
}