require 'adwords_api'

class ApplicationController < ActionController::API
  # Returns an API object.
  def get_adwords_api()
    @api ||= create_adwords_api()
    return @api
  end

  # Creates an instance of AdWords API class. Uses a configuration file and
  # Rails config directory.
  def create_adwords_api()
    config_filename = File.join(Rails.root, 'config', 'adwords_api.yml')
    @api = AdwordsApi::Api.new(config_filename)
    token = #session[:token]
    # If we have an OAuth2 token in session we use the credentials from it.
    if token
      credentials = @api.credential_handler()
      credentials.set_credential(:oauth2_token, token)
      credentials.set_credential(:client_customer_id, selected_account)
    end
    return @api
  end
end
