require 'httparty'

module Uber
  class Client
    include HTTParty
    base_uri 'api.uber.com'

    attr_reader :version, :token

    def initialize(token:, version: "v1")
      @token, @version = token, version
      self.class.headers authorization_header
    end

    def history(opts = {})
      response = self.class.get("/#{version}/history", query: opts)
      response.success? ? response["history"] : []
    end

    private

    def authorization_header
      { "Authorization" => "Bearer #{self.token}" }
    end
  end
end
