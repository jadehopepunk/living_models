# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_living_models_session',
  :secret      => '2b28a6814aa44c26f9f679cfd8a73c1b4ab175ed19ab80984c1dcc002c7539ec58d7fac6e9ff4e61ec1a151a2949a37a7df85048bd272a403843623ea5e9b91e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
