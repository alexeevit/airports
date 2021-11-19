require 'rails_helper'

RSpec.describe 'API::V1::AirportsController', type: :request do
  describe 'show' do
    subject(:airports_request) { ->(params = {}) { json_get api_v1_airports_url, params: params } }

    before do
      %i[fra muc zrh vie inn grz].each { |iata| create(:airport, iata) }
    end

    it 'returns airports', :aggregate_failures do
      airports_request.call

      expect(response.status).to eq(200)
      expect(json.size).to eq(6)
    end

    it 'returns airports for specific countries' do
      airports_request.call(countries: ['AT', 'CH'])

      expect(response.status).to eq(200)
      expect(json.size).to eq(4)
    end
  end
end
