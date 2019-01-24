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

      option :token_params, { headers: { 'api-version' => API_VERSION } }

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
        @raw_info ||= access_token.get('auth/api/v1/users/me', headers).parsed['response']
      end

      def headers
        { headers: { 'api-version' => API_VERSION } }
      end

      def callback_url(include_query_string = true)
        full_host + script_name + callback_path
      end

    end
  end
end
