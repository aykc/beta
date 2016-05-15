class Option < ActiveRecord::Base
  belongs_to :option_group
  has_many :option_values
end
