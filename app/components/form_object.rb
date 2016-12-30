module Components
  module FormModel
    extend ActiveSupport::Concern

    included do
      extend ClassMethods
    end

    module ClassMethods
      def model_class(value = nil)
        if value
          @model_class = value
        elsif !defined? @model_class
          raise NotImplementedError, "method `model_class` for Form object '#{self}' must be specified"
        end
        @model_class
      end
    end
  end

  class FormObject
    include ActiveModel::Validations
    include Virtus.model
    include FormModel

    def model(value = nil)
      @model = value if value
      @model ||= self.class.model_class.new
    end
  end
end