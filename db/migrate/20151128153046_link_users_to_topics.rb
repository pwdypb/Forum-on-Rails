class LinkUsersToTopics < ActiveRecord::Migration
  def change
    create_table :users_to_topics, id: false do |t|
      t.belongs_to :topic, index: true
      t.belongs_to :user, index: true
    end
  end
end
