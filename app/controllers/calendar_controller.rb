class CalendarController < ApplicationController
  before_action :set_client, only: [:index]
  def index
    @event = Event.new
  end
  
  private
  
  def set_client
    @client = Client.find(current_user.role_id)
  end
end
