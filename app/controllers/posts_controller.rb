class PostsController < ApplicationController
  def show
    id = params[:id]

    @Posts = Post.find_by(topic_id: id)
  end
end
