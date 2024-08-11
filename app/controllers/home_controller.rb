class HomeController < ApplicationController
  def index
    @recent_estates = Estate.order(created_at: :desc).limit(5)
  end
end
