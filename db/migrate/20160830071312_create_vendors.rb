class CreateVendors < ActiveRecord::Migration[5.0]

def change
   create_table :vendors do |t|
     t.string :name
     t.string :address1
     t.string :address2
     t.string :street
     t.references :region, foreign_key: true
     t.references :city, foreign_key: true
     t.references :state, foreign_key: true
     t.decimal :lat
     t.decimal :lng
     t.decimal :ranking
     t.references :vendor_type, foreign_key: true
     t.string :contact_name_1
     t.string :contact_email_1
     t.string :contact_mob_1
     t.string :contact_name_2
     t.string :contact_email_2
     t.string :contact_mob_2
     t.string :listing_category
     t.boolean :active

     t.timestamps
   end
 end
 end
