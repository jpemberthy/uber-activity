require "rspec"
require "factory"
require File.join(File.dirname(__FILE__), "../server")
require File.join(File.dirname(__FILE__), "../uber")

def factory
  @factory ||= Factory.new
end
