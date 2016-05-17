class OptionValue < ActiveRecord::Base
  belongs_to :option
#  has_and_belongs_to_many :items
  has_many :properties
  has_many :items, through: :properties
end
