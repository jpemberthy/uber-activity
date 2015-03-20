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

  def build_create_ride_parsed_response(opts = {})
    {
      "status"=>"processing",
      "request_id"=>"862b7d9d-94aa-40b1-8689-31035a1b70d9",
      "driver"=>nil,
      "eta"=>9,
      "location"=>nil,
      "vehicle"=>nil,
      "surge_multiplier"=>1.0
    }.merge(opts)
  end

  def build_sandbox_client(attributes = {})
    atts = {token: ENV['TEST_ACCESS_TOKEN'], sandbox: true}.merge(attributes)
    Uber::Client.new(atts)
  end

end
