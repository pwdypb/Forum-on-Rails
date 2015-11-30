namespace :db do
  desc "TODO"
  task populate: :environment do
    Rake::Task["db:migrate"].invoke

    User.create(name: "John", email: "john@doe.com", password: "password")
    
  end

end
