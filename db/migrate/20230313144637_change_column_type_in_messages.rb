class ChangeColumnTypeInMessages < ActiveRecord::Migration[7.0]
  def change
    change_column :messages, :content, :text
  end
end
