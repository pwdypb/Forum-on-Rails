class TopicsController < ApplicationController
  def show
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    # @topic = Topic.new(params.require(:topic).permit(:title))
    @topic = Topic.new
    @topic.title = params.require(:topic).permit(:title)[:title]

    if @topic.save
      @topic.users << current_user
      flash[:success] = "Fórumtéma létrehozva"
      redirect_to topics_path
    else
      flash[:danger] = "Fórumtéma létrehozása sikertelen"
      redirect_to topics_path
    end
  end

  def destroy
    id = params[:id]

    topic = Topic.find(id)

    topic.destroy

    redirect_to topics_path
  end
end
