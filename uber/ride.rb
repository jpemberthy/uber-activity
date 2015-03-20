module Uber
  class Ride
    ATTRS = [:request_id, :status, :vehicle, :driver, :location, :eta, :surge_multiplier]
    READONLY_ATTRS = [:request_id]
    RW_ATTRS = ATTRS - READONLY_ATTRS

    attr_reader *READONLY_ATTRS
    attr_accessor *RW_ATTRS

    def initialize(attrs = {})
      ATTRS.each do |attr|
        instance_variable_set("@#{attr}", attrs[attr.to_s])
      end
    end

    def uuid
      self.request_id
    end
  end
end
