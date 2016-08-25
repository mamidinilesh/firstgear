class CreateRegions < ActiveRecord::Migration[5.0]
  def change
    create_table :regions do |t|
      t.string :name
      t.references :city, foreign_key: true
      t.boolean :active

      t.timestamps
    end
  end
end
