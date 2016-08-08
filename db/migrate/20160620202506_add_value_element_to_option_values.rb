class AddValueElementToOptionValues < ActiveRecord::Migration
  def change
    add_reference :option_values, :value_element, polymorphic: true, index: true
  end
end
