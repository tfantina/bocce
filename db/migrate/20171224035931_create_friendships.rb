class CreateFriendships < ActiveRecord::Migration[5.1]
  def change
    create_table :friendships do |t|
      t.integer :user_id
      t.integer :user2_id
      t.integer :requested
      t.datetime :last_interaction

      t.timestamps
    end
    add_index :friendships, :user_id
    add_index :friendships, :user2_id
    add_index :friendships [:user_id, :user2_id], unique: true

  end
end
