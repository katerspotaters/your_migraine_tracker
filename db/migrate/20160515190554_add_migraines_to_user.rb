class AddMigrainesToUser < ActiveRecord::Migration
  def change
    create_table :migraines do |t|
      t.integer :intensity
      t.datetime :occurrence_time
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
