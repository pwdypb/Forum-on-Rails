class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :text
      t.string :owner_id
      t.string :topic_id
      t.timestamps null: false
    end
  end
end
