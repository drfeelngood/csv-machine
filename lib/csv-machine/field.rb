module CSVMachine

  class Field 

    attr_reader :name
    attr_reader :options

    VALID_OPTIONS = [ :column, :type ] # TODO: :convert

    def initialize(name, options={})
      @name, @options = name.to_sym, options
    end

    def column
      @options[:column]
    end

  end

end
