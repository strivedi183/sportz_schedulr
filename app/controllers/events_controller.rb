class EventsController < ApplicationController
  def new

  end

  def index
    @events = @auth.events.all
  end
end