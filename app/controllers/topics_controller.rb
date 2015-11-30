class TopicsController < ApplicationController
  def show
    @topics = Topic.all
  end
end
