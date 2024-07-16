class CreateAnalyses < ActiveRecord::Migration[7.1]
  def change
    create_table :analyses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :url
      t.text :result
      t.string :matched_company
      t.json :keyword_counts

      t.timestamps
    end
  end
end
