class ChangeColumnNameType2 < ActiveRecord::Migration[5.0]
  def change
  end

  def self.up
    rename_column :rate_cards , :commission , :rate
  end
end
