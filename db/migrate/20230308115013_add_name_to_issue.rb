class AddNameToIssue < ActiveRecord::Migration[7.0]
  def change
    add_column :issues, :name, :string
  end
end
