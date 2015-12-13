class PostsController < ApplicationController
  def show
    id = params[:id]

    # @posts = Post.find_by(topic_id: id)
    @posts = Post.where("topic_id = #{id}").order("created_at DESC")


  end
end
