class CreateVendeContrctMaps < ActiveRecord::Migration[5.0]
  def change
    create_table :vende_contrct_maps do |t|
      t.references :vendor_contract, foreign_key: true
      t.references :category, foreign_key: true
      t.decimal :commission
      t.boolean :is_inclusive
      t.boolean :active

      t.timestamps
    end
  end
end
