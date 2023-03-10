class AddMessageLikesToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :message_likes, :integer
  end
end
