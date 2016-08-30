class CreateVenderServiceMaps < ActiveRecord::Migration[5.0]
  def change
    create_table :vender_service_maps do |t|
      t.references :vendor, foreign_key: true
      t.references :service, foreign_key: true
      t.references :vehicle, foreign_key: true
      t.decimal :commission
      t.boolean :is_inclusive
      t.boolean :active

      t.timestamps
    end
  end
end
