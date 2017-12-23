class AddFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :interests, :text
    add_column :users, :phone, :string
    add_column :users, :website, :string
  end
end
