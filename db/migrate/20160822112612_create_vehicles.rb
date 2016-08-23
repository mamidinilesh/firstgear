class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
      t.string :v_type
      t.belongs_to :brand, index: true
    #  t.integer :brand_id
      t.string :model
      t.string :variant
      t.string :transmission
      t.boolean :active

      t.timestamps
    end
  end
end
