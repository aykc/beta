class IntegerValue < ActiveRecord::Base
  has_one :option_value, as: :value_element
  validates :value, presence: true, allow_blank: false
end
