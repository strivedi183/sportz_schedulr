class MeetupsController < ApplicationController
  def new
    redirect_to root_path and return unless @auth.id == params[:user_id].to_i

    @meetup = Meetup.new
    @user   = User.find params[:user_id]
    @event  = Event.find params[:event_id]
    @google_client = GooglePlaces::Client.new ENV['GOOGLE_API_KEY']
    @spots = @google_client.spots(@event.venue.lat, @event.venue.lng, :types => 'bar', :radius => 5000)

    @venues = @spots.map { |spot| Venue.new :name => spot.name, :lat => spot.lat, :lng => spot.lng }

    render 'events/show'
  end

  def create
    # save the venue
    venue = eval params[:venue]
    venue = Venue.find_or_create_by_lat_and_lng :name => venue[:name], :lat => venue[:lat], :lng => venue[:lng]

    # establish the number of friends invited

  end

  def index
  end
end