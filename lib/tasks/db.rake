namespace :db do
  desc "TODO"
  task populate: :environment do
    Rake::Task["db:migrate"].invoke

    User.create(name: "John", email: "john@doe.com", password: "password")
    User.create(name: "Jane", email: "jane@doe.com", password: "password")

    Topic.create(title: "TesztTopic1", owner: User.first.id)
    Topic.create(title: "TesztTopic2", owner: User.last.id)
  end

end
