class AddValueTypeToOptions < ActiveRecord::Migration
  def change
    add_column :options, :value_type, :string
  end
end
