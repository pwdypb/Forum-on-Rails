class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :text
      t.belongs_to :user, index: true
      t.belongs_to :topic, index: true
      t.timestamps null: false
    end
  end
end
