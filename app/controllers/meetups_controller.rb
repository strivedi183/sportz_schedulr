class MeetupsController < ApplicationController
  def new
    redirect_to root_path and return unless @auth.id == params[:user_id].to_i
    @meetup = Meetup.new
    @user   = User.find params[:user_id]
    @event  = Event.find params[:event_id]
    @google_client = GooglePlaces::Client.new ENV['GOOGLE_API_KEY']
    @spots = @google_client.spots(@event.venue.lat, @event.venue.lng, :types => 'bar', :radius => 5000)
    @venues = @spots.map { |spot| Venue.find_or_create_by_name :name => spot.name, :lat => spot.lat, :lng => spot.lng }
    @friends = @auth.get_friends.map do |f|
      Friend.find_or_create_by_facebook_id :name => f['name'], :email => f['email'], :facebook_id=>f['id']
    end
    render 'events/show'
  end

  def create
    # establish parameters
    venue   = Venue.find params[:meetup][:venue]
    friends = params[:friend_ids].map {|friend_id| Friend.find friend_id }

    # build meetup
    meetup = Meetup.new
    friends.each {|f| meetup.friends << f}
    meetup.venue = venue

    # assign meetup to auth
    @auth.meetups << meetup
    redirect_to meetups_path
  end

  def index
  end

  private
  def meetup_params
    params.require(:meetup).permit(:venue)
  end

end