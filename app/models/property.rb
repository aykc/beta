class Property < ActiveRecord::Base
  belongs_to :item
  belongs_to :option_value
end
