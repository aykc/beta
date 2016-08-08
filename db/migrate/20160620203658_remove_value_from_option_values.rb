class RemoveValueFromOptionValues < ActiveRecord::Migration
  def change
    remove_column :option_values, :value
  end
end
