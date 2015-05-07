class FeedsController < ApplicationController
  layout false

  def rss
    @events = Event.future
  end
end
