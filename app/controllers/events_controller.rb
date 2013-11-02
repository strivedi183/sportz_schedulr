class EventsController < ApplicationController
  def new
  end

  def show
    @event = Event.find params[:id]
    @google_client = GooglePlaces::Client.new ENV['GOOGLE_API_KEY']
    @spots = @google_client.spots(@event.venue.lat, @event.venue.lng, :types => 'bar', :radius => 5000)
  end

  def index
    @events = Event.all
  end
end