class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.string :region
      t.string :name
      t.references :category, foreign_key: true
      t.integer :default_commission
      t.boolean :active

      t.timestamps
    end
  end
end
