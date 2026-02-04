resource "keycloak_openid_client" "superset" {
  realm_id  = keycloak_realm.superset.id
  client_id = "superset-client"
  name      = "Apache Superset"
  enabled   = true

  access_type = "CONFIDENTIAL"

  standard_flow_enabled = true
  implicit_flow_enabled = false
  direct_access_grants_enabled = false

  valid_redirect_uris = [
    "${var.superset_base_url}/oauth-authorized/keycloak"
  ]

  web_origins = [
    var.superset_base_url
  ]

  base_url = var.superset_base_url

  client_secret = random_password.superset_secret.result
}
