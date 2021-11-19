module API
  module V1
    class AirportsController < BaseController
      def index
        airports = Airport.all
        render json: AirportBlueprint.render(airports)
      end
    end
  end
end
