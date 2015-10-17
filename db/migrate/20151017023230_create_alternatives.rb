class CreateAlternatives < ActiveRecord::Migration
  def change
    create_table :alternatives do |t|
      t.string :title
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
