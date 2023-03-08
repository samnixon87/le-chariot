class AddColumnsToIssues < ActiveRecord::Migration[7.0]
  def change
    add_column :issues, :title, :string
    add_column :issues, :code_block, :text
    change_column :issues, :description, :text
  end
end
