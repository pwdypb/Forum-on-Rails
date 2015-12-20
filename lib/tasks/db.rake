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

    t = Topic.new(title: "TesztTopic1")
    t.users << admin
    t.save

    t = Topic.new(title: "TesztTopic2")
    t.users << admin
    t.save

    Post.create(text: "Lorem ipsum", user_id: User.first.id, topic_id: Topic.first.id)
    Post.create(text: lorem, user_id: admin.id, topic_id: Topic.first.id)
    Post.create(text: lorem, user_id: john.id, topic_id: Topic.first.id)
    Post.create(text: lorem, user_id: admin.id, topic_id: Topic.last.id)
    Post.create(text: lorem, user_id: jane.id, topic_id: Topic.last.id)
  end

end
