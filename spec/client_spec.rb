require 'spec_helper'

describe Uber::Client do
  let(:client) { Uber::Client.new(token: "123") }
  let(:sandbox_client) { Uber::Client.new(token: "123", sandbox: true) }

  it "points to production by default" do
    expect(client.sandbox).to be(false)
    expect(client.class.base_uri).to eq(Uber::Client::NONSANDBOX_URI)
  end

  it "points to sandbox in sandbox mode" do
    expect(sandbox_client.sandbox).to be(true)
    expect(sandbox_client.class.base_uri).to eq(Uber::Client::SANDBOX_URI)
  end

  describe Uber::Client::Rides do
    let(:client) { factory.build_sandbox_client(version: "v1") }
    let(:body) { factory.build_ride_request_body }

    describe "#request_ride" do
      it "Requests a ride" do
        ride = client.request_ride(body)
        expect(ride.status).to eq('processing')
        expect(ride).to be_kind_of(Uber::Ride)
      end
    end

    describe "#ride" do
      it "retrieves the trip info from uber" do
        ride = client.request_ride(body)

        client.update_ride(ride.uuid, status: "accepted")
        ride = client.ride(ride.uuid)
        expect(['accepted', 'arriving']).to include(ride.status)

        client.update_ride(ride.uuid, status: "in_progress")
        ride = client.ride(ride.uuid)
        expect(ride.status).to eq("in_progress")

        client.update_ride(ride.uuid, status: "completed")
        ride = client.ride(ride.uuid)
        sleep(2)
        expect(ride.status).to eq("completed")
      end
    end

    describe "#cancel_ride" do
      it "cancels a ride" do

      end
    end
  end
end
