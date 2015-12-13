module PostsHelper
  def author(post)
    user_id = post.owner_id

    user = User.find(user_id)
    user.name
  end
end
