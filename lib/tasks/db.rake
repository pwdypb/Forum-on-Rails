namespace :db do
  desc "TODO"
  task populate: :environment do
    Rake::Task["db:migrate"].invoke

    lorem = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
            dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex
            ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat
            nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit
            anim id est laborum.'


    admin = User.create(name: "admin", email: "admin@admin.com", password: "password", admin: true)
    jane = User.create(name: "Jane", email: "jane@doe.com", password: "password", admin: false)
    john = User.create(name: "John", email: "john@doe.com", password: "password", admin: false)

    Topic.create(title: "TesztTopic1", owner: admin.id)
    Topic.create(title: "TesztTopic2", owner: john.id)

    Post.create(text: "Lorem ipsum", user_id: User.first.id, topic_id: Topic.first.id)
    Post.create(text: lorem, user_id: admin.id, topic_id: Topic.first.id)
    Post.create(text: lorem, user_id: john.id, topic_id: Topic.first.id)
    Post.create(text: lorem, user_id: admin.id, topic_id: Topic.last.id)
    Post.create(text: lorem, user_id: jane.id, topic_id: Topic.last.id)
  end

end
