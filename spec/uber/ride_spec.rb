require 'spec_helper'

describe Uber::Ride do
  let(:client) { factory.build_sandbox_client(version: "v1") }

  describe "initialization" do
    let(:atts) { factory.build_create_ride_parsed_response }

    it "sets values" do
      ride = Uber::Ride.new(atts)
      expect(ride.status).to eq("processing")
      expect(ride.uuid).to be_a_kind_of(String)
      expect(ride.uuid).to eq(ride.request_id)
    end
  end
end
