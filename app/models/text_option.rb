class TextOption < ActiveRecord::Base
  has_one :option, as: :option_element
end
