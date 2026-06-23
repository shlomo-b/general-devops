# Comment out this file + terraform apply  => deletes the key from GCP.
# Uncomment + terraform apply             => creates a new key (unique name each cycle).
# GCP soft-deletes API key names; random_id avoids "already exists" on recreate.

# resource "random_id" "maps_api_key" {
#   byte_length = 4
# }

resource "google_apikeys_key" "maps_api_key" {
  project         = google_project.projects["shlomo_prod"].project_id
  name            = "maps-api-key"
  display_name    = "Maps API Key"
  deletion_policy = "DELETE"

  restrictions {
    browser_key_restrictions {
      allowed_referrers = [
        "*.test.co.il/*",
        "*.test1.co.il/*",
        "*.test2.co.il/*",
      ]
    }

    api_targets {
      service = "maps-backend.googleapis.com"
    }

    api_targets {
      service = "distance-matrix-backend.googleapis.com"
    }
  }

  depends_on = [
    google_project_service.enable_apis,
  ]
}



# Output the API key value to use in the application.
#----------------------maps-api-key----------------------------------#
output "maps_api_key" {
  description = "Google Maps API Key"
  value       = google_apikeys_key.maps_api_key.key_string
  sensitive   = true
}


#----------------------maps-api-key-api-services----------------------------------#
# "apikeys.googleapis.com",
# "streetviewpublish.googleapis.com",
# "maps-embed-backend.googleapis.com",
# "maps-backend.googleapis.com",
# "maps-android-backend.googleapis.com",
# "maps-ios-backend.googleapis.com",
# "static-maps-backend.googleapis.com",
# "street-view-image-backend.googleapis.com",
# "directions-backend.googleapis.com",
# "distance-matrix-backend.googleapis.com",
# "roads.googleapis.com"