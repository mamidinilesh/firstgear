class CreateVendorContracts < ActiveRecord::Migration[5.0]
  def change
    create_table :vendor_contracts do |t|
      t.references :vendor, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.string :comments
      t.decimal :listing_fees
      t.decimal :listing_fees_paid
      t.boolean :active

      t.timestamps
    end
  end
end
