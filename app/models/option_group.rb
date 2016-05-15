class OptionGroup < ActiveRecord::Base
  belongs_to :category
  has_many :options
end
