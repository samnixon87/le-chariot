class CreateSuggestedAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :suggested_answers do |t|
      t.references :issue, null: false, foreign_key: true
      t.references :message, null: false, foreign_key: true

      t.timestamps
    end
  end
end
