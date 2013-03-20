require 'csv'
require 'csv-machine/field'

module CSVMachine

  def self.included(base)
    base.extend ClassMethods
  end

  # TODO: def self.map(klass, &block)
  # end

  module ClassMethods
    attr_reader :csv_fields
    attr_reader :csv_options
    
    def csv_fields
      @csv_fields ||= {}
    end

    def csv_options
      @csv_options ||= CSV::DEFAULT_OPTIONS
    end

    # @param [Symbol, #to_sym] name
    # @param [Hash] options
    def field(name, options={})
      #options.clone do |hash|
        #hash[(key.to_sym rescue key) || key] = options.delete(key)
      #end
      
      options[:column] ||= begin
        csv_fields.empty? ? 0 : ( csv_fields.values.last.options[:column] + 1 )
      end

      _field = Field.new(name, options)
      create_attribute(_field.name)
      csv_fields[_field.name] = _field
    end

    # @param [Array] row Parsed csv row
    def from_csv(row)
      new.tap do |obj|
        csv_fields.each { |n, f| obj.__send__(:"#{n}=", row[f.column]) }
      end
    end

    def create_attribute(name)
      attr_reader name unless method_defined?(name)
      attr_writer name unless method_defined?(:"#{name}=")
    end

  end

end
