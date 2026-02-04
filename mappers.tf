# --------------------------------------------------
# Email mapper
# --------------------------------------------------
resource "keycloak_openid_user_property_protocol_mapper" "email" {
  realm_id  = keycloak_realm.superset.id
  client_id = keycloak_openid_client.superset.id
  name      = "email"

  user_property = "email"
  claim_name    = "email"
}

# --------------------------------------------------
# Username mapper
# --------------------------------------------------
resource "keycloak_openid_user_property_protocol_mapper" "username" {
  realm_id  = keycloak_realm.superset.id
  client_id = keycloak_openid_client.superset.id
  name      = "username"

  user_property = "username"
  claim_name    = "preferred_username"
}

# --------------------------------------------------
# Realm roles mapper (CRITICAL for Superset)
# --------------------------------------------------
resource "keycloak_openid_user_realm_role_protocol_mapper" "realm_roles" {
  realm_id  = keycloak_realm.superset.id
  client_id = keycloak_openid_client.superset.id
  name      = "realm-roles"

  claim_name  = "roles"
  multivalued = true
}
