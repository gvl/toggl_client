module Toggl
  class Client
    extend Forwardable

    URL = 'https://www.toggl.com'.freeze

    attr_reader :api_token, :password

    def_delegators :connection, :headers

    def initialize(api_token)
      @api_token = api_token # '491099b594fc34cd7f8ea0f0f0c0f19a'
      @password = 'api_token'
    end

    def connection
      @connection ||= Faraday.new(URL, connection_options) do |f|
        f.request :url_encoded
        f.adapter Faraday.default_adapter
        f.basic_auth api_token, password
      end
    end

    private

    def connection_options
      {
        headers: {
          accept: 'application/json',
          content_type: 'application/json'
        },
        ssl: { verify: false }
      }
    end
  end
end
