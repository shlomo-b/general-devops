#----------------------recaptcha-key----------------------------------#
output "recaptcha_site_key" {
  value = [for key in google_recaptcha_enterprise_key.recaptcha_key : {
    allowed_domains = key.web_settings[0].allowed_domains[0]
    display_name = key.display_name
    site_key     = key.name
  }]
  description = "the name of the recaptcha key created for shlomo_prod project."
}