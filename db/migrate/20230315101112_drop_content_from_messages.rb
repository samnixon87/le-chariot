class DropContentFromMessages < ActiveRecord::Migration[7.0]
  def change
    remove_column :messages, :content, :text
  end
end
