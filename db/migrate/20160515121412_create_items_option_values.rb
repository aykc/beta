class CreateItemsOptionValues < ActiveRecord::Migration
  def change
    create_table :items_option_values do |t|
      t.references :item, index: true, foreign_key: true
      t.references :option_value, index: true, foreign_key: true
    end
  end
end
