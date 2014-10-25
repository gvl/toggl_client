module Toggl
  class Client
    extend Forwardable
    # Base url for Toggl API
    URL = 'https://www.toggl.com'.freeze

    # Version of Toggl API used
    API_VERSION = 'v8'.freeze

    # Delegate methods to Faraday::Connection
    def_delegators :connection, :headers

    # Creates instance of Client and call #connection
    # See #connection documentation
    def self.connection(api_token)
      new.connection(api_token)
    end

    # Creates new connection to Toggl API
    #
    # @example
    #   connection('1234567890abcdef') # => Faraday::Connection
    #
    # @param api_token [String] Toggl token
    # @return [Faraday::Connection]
    def connection(api_token)
      @connection ||= Faraday.new(URL, connection_options) do |f|
        f.request :url_encoded
        f.adapter Faraday.default_adapter
        f.basic_auth api_token, 'api_token'
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
