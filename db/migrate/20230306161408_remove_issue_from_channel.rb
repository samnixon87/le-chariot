class RemoveIssueFromChannel < ActiveRecord::Migration[7.0]
  def change
    remove_reference :channels, :issue, null: false, foreign_key: true
  end
end
