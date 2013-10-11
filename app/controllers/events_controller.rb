class EventsController < ApplicationController
  def new

  end

  def index
    @events = Event.all
  end
end