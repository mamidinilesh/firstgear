class CreateRateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :rate_cards do |t|
      t.references :vehicle, foreign_key: true
      t.references :service, foreign_key: true
      t.references :vendor, foreign_key: true
      t.decimal :rate
      t.boolean :is_inclusive
      t.boolean :active

      t.timestamps
    end
  end
end
