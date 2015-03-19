module Uber
  class Client
    module Rides

      # POST v1/requests
      def request_ride(body)
        post("requests", body: body)
      end

      def ride(ride_id)
        self.class.get("/#{version}/requests/#{ride_id}")
      end

      # DELETE v1/request/:ride_id
      def cancel_ride(ride_id)
        self.class.delete("/#{version}/requests/#{ride_id}")
      end
    end
  end
end
