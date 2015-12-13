namespace :db do
  desc "TODO"
  task populate: :environment do
    Rake::Task["db:migrate"].invoke

    User.create(name: "John", email: "john@doe.com", password: "password")
    User.create(name: "Jane", email: "jane@doe.com", password: "password")

    Topic.create(title: "TesztTopic1", owner: User.first.id)
    Topic.create(title: "TesztTopic2", owner: User.last.id)

    Post.create(text: "Lorem ipsum", owner_id: User.first.id, topic_id: Topic.first.id)
    Post.create(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", owner_id: User.first.id, topic_id: Topic.first.id)
  end

end
