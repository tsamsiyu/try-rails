module Components
  # TODO: need to review about the class variables
  class Form
    include ActiveModel::Validations

    def self.model_class(value = nil)
      if value
        @@model_class = value
      elsif !defined? @@model_class
        raise NotImplementedError, "method `model_class` for Form object '#{self}' must be specified"
      end
      @@model_class
    end

    def self.attributes(*list)
      @@names = list
      list.each { |attr| attr_accessor attr }
    end

    # TODO: can be refactored
    def attributes
      res = {}
      @@names.each do |name|
        res[name] = send(name)
      end
      res
    end

    def initialize(attributes = {})
      attributes.each_pair do |attribute, value|
        setter = "#{attribute}="
        if defined? setter
          send(setter, value)
        end
      end
    end

    def model
      @model ||= self.class.model_class.new
    end
  end
end