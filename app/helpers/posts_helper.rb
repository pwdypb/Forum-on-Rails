module PostsHelper
  def author(post)
    user_id = post.user_id

    @user = User.find(user_id)
  end
end
