class Category < ActiveRecord::Base
  has_many :option_groups
  has_many :options, through: :option_groups
  has_many :items
end
