class Public::CalendarsController < ApplicationController
  def index
    @calendars = Calendar.all
    @item = Item.all
  end

end