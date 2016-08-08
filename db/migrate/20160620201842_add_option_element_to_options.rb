class AddOptionElementToOptions < ActiveRecord::Migration
  def change
    add_reference :options, :option_element, polymorphic: true, index: true
  end
end
