require 'httparty'
require 'json'
require_relative 'client/rides'

module Uber
  class Client
    include HTTParty

    NONSANDBOX_URI = 'https://api.uber.com'
    SANDBOX_URI = 'https://sandbox-api.uber.com'

    include Rides

    attr_reader :version, :token, :sandbox

    def initialize(token:, version: "v1.1", sandbox: false)
      @token, @version, @sandbox = token, version, sandbox

      if sandbox?
        self.class.base_uri SANDBOX_URI
      else
        self.class.base_uri NONSANDBOX_URI
      end

      self.class.headers authorization_header
      self.class.headers format_header
    end

    def sandbox?
      !!@sandbox
    end

    def post(path, body: {})
      self.class.post("/#{version}/#{path}", body: body.to_json)
    end

    def put(path, body: {})
      self.class.put("/#{version}/#{path}", body: body.to_json)
    end

    def get(path, options: {})
      self.class.get("/#{version}/#{path}", options)
    end

    def history(opts = {})
      response = self.class.get("/#{version}/history", query: opts)
      response.success? ? response["history"] : []
    end

    private

    def authorization_header
      { "Authorization" => "Bearer #{self.token}" }
    end

    def format_header
      { "Content-Type" => "application/json" }
    end
  end
end
