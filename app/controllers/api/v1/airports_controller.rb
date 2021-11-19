module API
  module V1
    class AirportsController < BaseController
      def index
        airports = Airport.where(filter_params).all
        paginate json: AirportBlueprint.render_as_hash(airports)
      end

      private

      def filter_params
        permitted_params = params.permit(countries: [])

        {}.tap do |hash|
          hash[:country_alpha2] = permitted_params[:countries] if permitted_params[:countries].present?
        end
      end
    end
  end
end
