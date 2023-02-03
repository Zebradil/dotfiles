# +=========================+
# | GCP configuration       |
# +=========================+

if lib::check_commands gcloud; then
  log::debug "Configuring gcloud"
  export USE_GKE_GCLOUD_AUTH_PLUGIN=True
fi

