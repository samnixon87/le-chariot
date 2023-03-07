class AddFirstNameToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :batch, :integer
    add_column :users, :role, :boolean
  end
end
