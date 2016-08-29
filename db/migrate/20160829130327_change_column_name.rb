class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    def change
      rename_column :rate_cards , :commission , :rate
    end
  end
end
