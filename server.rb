require 'rubygems'
require 'bundler'

Bundler.require
Dotenv.load

class UberActivity < Sinatra::Base

  use Rack::Session::Cookie
  use OmniAuth::Builder do
    provider :uber, ENV['UBER_CLIENT_ID'], ENV['UBER_CLIENT_SECRET'], :scope => 'profile,history'
  end

  get '/' do
    "HELLO"
  end

end
