class MeetupsController < ApplicationController
  def new
    redirect_to root_path and return unless @auth.id == params[:user_id].to_i

    @user   = User.find params[:user_id]
    @event  = Event.find params[:event_id]
    @google_client = GooglePlaces::Client.new ENV['GOOGLE_API_KEY']
    @spots = @google_client.spots(@event.venue.lat, @event.venue.lng, :types => 'bar', :radius => 5000)
    render 'events/show'
  end

  def index
  end
end