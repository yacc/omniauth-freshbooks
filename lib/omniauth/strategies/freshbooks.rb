require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Freshbooks < OmniAuth::Strategies::OAuth2
      API_VERSION = 'alpha'.freeze

      option :name, 'freshbooks'

      option :client_options, {
        site: 'https://api.freshbooks.com',
        authorize_url: 'https://my.freshbooks.com/service/auth/oauth/authorize',
        token_url: 'https://api.freshbooks.com/auth/oauth/token'
      }

      option :token_params, {
        headers: { 'Api-Version' => API_VERSION }
      }

      uid { raw_info['id'] }

      info do
        {
          email: raw_info['email'],
          first_name: raw_info['name'],
          last_name: raw_info['name']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token
                        .get('auth/api/v1/users/me', { headers: { 'Api-Version' => API_VERSION } })
                        .parsed['response']
      end

      def callback_url(include_query_string = true)
        url = full_host + script_name + callback_path

        # Optional inclusion of query_string ensure the access token request redirect_uri is an exact match to the
        # authorized redirect URI defined in FreshBooks
        url += query_string if include_query_string

        # Ensure valid request for localhost because FreshBooks doesn't authorize non ssl callbacks.
        # The ssl response can then be altered from https:// to http:// manually for the purpose of testing.
        # This is limitation is noted in "Redirect URI Limitations" section of their documentation:
        # https://www.freshbooks.com/api/authentication
        url.gsub('http://localhost', 'https://localhost')
      end

      def build_access_token
        client.auth_code.get_token(
          request.params["code"],
          { redirect_uri: callback_url(false) }.merge(token_params.to_hash(symbolize_keys: true)),
          deep_symbolize(options.auth_token_params)
        )
      end
    end
  end
end
