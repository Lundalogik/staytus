require 'httparty'

module Staytus
  REQUEST_HEADERS = {
    "Content-Type" => "application/json",
    "Accept"       => "application/json",
    "User-Agent"   => "Staytus/1.0"
  }.freeze

  class Webhooks

    class << self

      def post(payload)        
        url = ENV['WEBHOOK_URL']

        unless url.nil?
          HTTParty.post(url, body: payload.to_json, headers: REQUEST_HEADERS)
        end
      end
    end
  end
end
