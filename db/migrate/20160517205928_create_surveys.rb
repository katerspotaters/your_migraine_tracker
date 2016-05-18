class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :food
      t.integer :water
      t.integer :caffeine
      t.references :migraine, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
