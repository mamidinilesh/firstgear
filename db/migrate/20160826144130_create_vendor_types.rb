class CreateVendorTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :vendor_types do |t|
      t.string :vendor_type
      t.boolean :active

      t.timestamps
    end
  end
end
