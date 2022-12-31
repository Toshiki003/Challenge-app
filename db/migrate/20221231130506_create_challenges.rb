class CreateChallenges < ActiveRecord::Migration[7.0]
  def change
    create_table :challenges do |t|
      t.string :nickname, limit: 30
      t.integer :timing
      t.string :category
      t.string :todo

      t.timestamps
    end
  end
end
