class OptionValue < ActiveRecord::Base
  before_validation :save_value
  belongs_to :option
  belongs_to :value_element, polymorphic: true
  has_one :option_group, through: :option
#  has_and_belongs_to_many :items
  has_many :properties
  has_many :items, through: :properties

#  delegate :value, to: :value_element, allow_nil: true
  delegate :value_type, to: :option

  validates :value_element_id, presence: true, allow_nil: false
  validates :value_element_type, presence: true, allow_nil: false

  def value
    @value || self.value_element.value if self.value_element
  end
  def value=(value)
    @value = value
  end

  def save_value
    if value_element.nil?
      klass = (value_type + "Value").constantize
      self.value_element = klass.find_or_create_by!(value: @value)
    end
  end

#   def value=(val)
# #    value_element.nil? ? (value_type + "_Value").constantize.new(value: val)
#     if value_element.nil?
#       klass = (value_type + "Value").constantize
#       self.value_element = klass.find_or_create_by!(value: val)
#     else
#       self.value_element.value = val
#     end
#   end

end
