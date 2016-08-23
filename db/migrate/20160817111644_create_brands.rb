class CreateBrands < ActiveRecord::Migration[5.0]
  def change
    create_table :brands do |t|
      t.string :name
      t.string :logo
      t.boolean :active

      t.timestamps
    end
  end
end
