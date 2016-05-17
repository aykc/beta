class Item < ActiveRecord::Base
  belongs_to :category
#  has_and_belongs_to_many :option_values
  has_many :properties
  has_many :option_values, through: :properties
  has_many :options, through: :option_values
  has_many :option_groups, through: :options

  accepts_nested_attributes_for :properties
end
