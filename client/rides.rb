module Uber
  class Client
    module Rides

      # POST <version>/requests
      def request_ride(body)
        response = post("requests", body: body)

        if response.code == 202
          Uber::Ride.new(response.parsed_response)
        else
          # TODO: Expose as error or surge required objects.
          response
        end
      end

      # PUT <version>/sandbox/requests/:ride_id
      def update_ride(trip_id, status:)
        body = { status: status }
        put("sandbox/requests/#{trip_id}", body: body)
      end

      # GET <version>/requests/:ride_id
      def ride(ride_id)
        response = get("requests/#{ride_id}")

        if response.code == 200
          Uber::Ride.new(response.parsed_response)
        end
      end

      # DELETE <version>/requests/:ride_id
      def cancel_ride(ride_id)
        delete("requests/#{ride_id}")
      end
    end
  end
end
