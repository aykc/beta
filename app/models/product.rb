class Product < ApplicationRecord
  belongs_to :category

  def spec_groups
    details['groups'].map{|g| SpecGroup.new(g)}
  end

  def spec_groups_attributes=(attributes)
    spec_groups = []
    attributes.each do |index, attrs|
      next if '1' == attrs.delete("_destroy")
      spec_groups << attrs
    end
    write_attribute(:spec_groups, spec_groups)
  end

  class SpecGroup
    attr_accessor :name, :options
    def initialize(attr)
      @name = attr['name']
      @options = attr['options']
    end
    
    def spec_options_attributes=(attributes)
      spec_options = []
      attributes.each do |index, attrs|
        next if '1' == attrs.delete("_destroy")
        spec_options << attrs
      end
      write_attribute(:spec_options, spec_options)
    end

    def persisted?() false; end
    def new_record?() false; end
    def marked_for_destruction?() false; end
    def _destroy() false; end

    def spec_options
      @options.map{|opt| SpecOption.new(opt)}
    end

    def spec_option(option_name)
      spec_options.detect{|option| option.name == option_name}
    end

    class SpecOption
      attr_accessor :name, :value
 
      def initialize(attr)
        @name = attr['name']
        @value = attr['value']
      end

      def persisted?() false; end
      def new_record?() false; end
      def marked_for_destruction?() false; end
      def _destroy() false; end

    end

  end

end
