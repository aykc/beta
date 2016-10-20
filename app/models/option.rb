class Option < ActiveRecord::Base
  belongs_to :option_group
  belongs_to :option_element, polymorphic: true
  has_many :option_values
  has_many :item_values, source: :option_values
  has_many :properties, through: :option_values
end
