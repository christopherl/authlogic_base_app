# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_authlogic-example_session',
  :secret      => '60caca25d13d55bb345feaa47e6bad25b6498254ea8527937ff35975c4b3dcdcb0d0aa39d7606533212107f1e34758b5c9f50804213adc5684d66d0fc2c803ee'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
