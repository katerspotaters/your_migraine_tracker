class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :food
      t.integer :water
      t.integer :caffeine
      t.timestamps null: false
    end
  end
end
