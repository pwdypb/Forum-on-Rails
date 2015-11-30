class StaticPagesController < ApplicationController
  def home
    if logged_in?
      redirect_to :topics
    end
  end
end
