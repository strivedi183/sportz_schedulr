class Api::VenuesController < ApplicationController
  respond_to :json
  def show
    venue = Venue.find(params[:id])
    venue_hash = {
      :name         => venue.name,
      :description  => venue.description,
      :lat          => venue.lat,
      :lng          => venue.lng
      }.to_json
    respond_with venue_hash
  end
end