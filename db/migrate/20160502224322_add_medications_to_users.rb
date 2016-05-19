class AddMedicationsToUsers < ActiveRecord::Migration
  def change
      create_table :medications do |t|
      t.string :name
      t.integer :dosage_amount
      t.string :dosage_measurement
      t.integer :frequency_amount
      t.string :frequency_measurement
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
