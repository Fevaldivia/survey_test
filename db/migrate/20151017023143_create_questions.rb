class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :topic

      t.timestamps null: false
    end
  end
end
