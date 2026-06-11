argocd_repos_new = {
  gl-infra-values-repo = {
    type = "git"
    repo = local.values_repo
  }

  gl-infra-charts-repo = {
    type = "git"
    repo = local.charts_repo
  }
}