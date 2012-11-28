class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :body
      t.integer :reply_to_id

      t.timestamps
    end
  end
end
