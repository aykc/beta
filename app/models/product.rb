class Product < ApplicationRecord
  belongs_to :category
#  serialize :details, HashSerializer

  def spec_groups
    details['options']
  end

  class SpecGroup
  end

end
