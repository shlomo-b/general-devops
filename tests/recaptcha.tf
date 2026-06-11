
resource "google_recaptcha_enterprise_key" "recaptcha_key" {
  for_each = var.recaptcha_key

  project      = each.value.project_id
  display_name = each.value.display_name

  web_settings {
    integration_type  =  "CHECKBOX"
    allow_all_domains = false

    allowed_domains = [
      each.value.allowed_domains
    ]
  }
}