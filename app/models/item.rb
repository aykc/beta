class Item < ActiveRecord::Base
  belongs_to :category
#  has_and_belongs_to_many :option_values
  has_many :properties
  has_many :option_values, through: :properties
  has_many :options, through: :option_values
  has_many :option_groups, through: :options
  has_many :default_groups, through: :category, source: :option_groups
  has_many :default_options, through: :category, source: :options

  # has_many :option_groups, through: :category
  # has_many :options, through: :option_groups
  # has_many :option_values, through: :options
  # has_many :item_values, through: :properties, source: :option_value

  accepts_nested_attributes_for :properties
  accepts_nested_attributes_for :option_values
end
