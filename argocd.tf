resource "kubernetes_secret_v1" "github_app_repository_secret" {
  for_each = local.argocd_repos_new

  metadata {
    name      = each.key
    namespace = kubernetes_namespace_v1.this["argocd"].metadata[0].name

    labels = {
      "argocd.argoproj.io/secret-type" = "repository"
    }
  }

  type = "Opaque"

  string_data = {
    url                     = each.value.repo
    type                    = each.value.type
    githubAppID             = var.tfe_github_application_id
    githubAppInstallationID = var.tfe_github_installation_id
    githubAppPrivateKey     = var.tfe_github_private_key
    project                 = local.environment
  }
}