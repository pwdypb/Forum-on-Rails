class PostsController < ApplicationController
  def new

    @post = Post.new
  end

  def create
    @post = @post = Post.new(post_params)
    topic_id = params[:id]
    topic = Topic.find(topic_id)

    @post.user = current_user
    @post.topic = topic

    @post.save


    redirect_to posts_path(topic_id)
  end

  def show
    id = params[:id]

    # @posts = Post.find_by(topic_id: id)
    @posts = Post.where("topic_id = #{id}").order("created_at DESC")
  end

  def destroy
    id = params[:id]

    post = Post.find(id)
    topic_id = post.topic.id

    post.destroy

    redirect_to posts_path(topic_id)
  end

  private

  def post_params
    params.require(:post).permit(:text)
  end
end
