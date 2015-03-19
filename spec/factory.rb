# Helper methods to build any kind of object.

class Factory

  def build_ride_request_body(opts = {})
    {
      start_latitude: 37.880970,
      start_longitude: -121.920247,
      end_latitude: 37.878955,
      end_longitude: -121.919152,
      product_id: "a1111c8c-c720-46c3-8534-2fcdd730040d"
    }.merge(opts)
  end

  def build_sandbox_client(attributes = {})
    atts = {token: ENV['TEST_ACCESS_TOKEN'], sandbox: true}.merge(attributes)
    Uber::Client.new(atts)
  end

end
