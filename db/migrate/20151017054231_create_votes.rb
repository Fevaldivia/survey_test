class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user, index: true, foreign_key: true
      t.references :alternative, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :votes, [:alternative_id, :user_id], unique: true
  end
end
