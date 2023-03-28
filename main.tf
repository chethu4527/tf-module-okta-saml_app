terraform {
  required_providers {
    okta = {
      source  = "okta/okta"
      version = "~> 3.40"
    }
  }
}

locals {

  nameid_format = "urn:oasis:names:tc:SAML:1.1:nameid-format:"
  oktaapp       = "O-OKTASSO-"
}


resource "okta_app_saml" "OKTA_SAML" {
  label                    = var.appname
  sso_url                  = var.sso_url
  recipient                = var.recipient
  destination              = var.destination
  audience                 = var.audience
  subject_name_id_template = "$${user.${var.subject_name_id_template}}"
  subject_name_id_format   = "${local.nameid_format}${var.subject_name_id_format}"
  response_signed          = true
  signature_algorithm      = "RSA_SHA256"
  honor_force_authn        = false
  authn_context_class_ref  = "urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport"
  digest_algorithm         = "SHA256"
  assertion_signed         = true
  attribute_statements {
    type         = "GROUP"
    name         = var.group_attribute_name
    filter_type  = var.group_filtertype
    filter_value = var.group_filtervalue
  }
  attribute_statements {
    name   = var.user_name
    values = [var.user_value]
  }
}

resource "okta_group" "OKTA_SAML_APP_GROUP" {
  count       = var.assignment_group==null ? 1 : 0
  name        = "${local.oktaapp}${okta_app_saml.OKTA_SAML.label}"
  description = "This group is Created for OKTA SSO application ${okta_app_saml.OKTA_SAML.label}"
}

 data "okta_groups" "OKTA_SAML_FINDGROUP" {
    count = var.assignment_group!=null ? 1 : 0  
    q = var.assignment_group
}

resource "okta_app_group_assignment" "OKTA_SAML_APP_GROUP_ASSIGNMENT" {
  app_id   = okta_app_saml.OKTA_SAML.id
  group_id = var.assignment_group!=null?data.okta_groups.OKTA_SAML_FINDGROUP[0].groups[0].id:okta_group.OKTA_SAML_APP_GROUP[0].id
}
