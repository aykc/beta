class OptionValue < ActiveRecord::Base
  belongs_to :option
  has_and_belongs_to_many :items
end
