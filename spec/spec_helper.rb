require "rspec"
require "factory"
require File.join(File.dirname(__FILE__), "../server")

def factory
  @factory ||= Factory.new
end