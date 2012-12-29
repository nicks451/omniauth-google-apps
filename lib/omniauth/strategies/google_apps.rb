require 'omniauth-openid'
require 'openid/gapps'

module OmniAuth
  module Strategies
    class GoogleApps < OmniAuth::Strategies::OpenID
      option :name, "google_apps"
      option :domain, nil

      def get_identifier
        f = OmniAuth::Form.new(:title => 'Google Apps Authentication')
        f.label_field('Google Apps Domain', 'domain')
        f.select('domain', [{:value => 'dedoinc.com', :name => 'Dedo'}, {:value => 'mmillerassociates.com', :name => 'Miller And Associates'}])
        f.to_response
      end

      def identifier
        options[:domain] || request['domain']
      end
    end
  end
end
