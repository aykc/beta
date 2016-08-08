class Property < ActiveRecord::Base
  belongs_to :item
  belongs_to :option_value

  accepts_nested_attributes_for :option_value
end
