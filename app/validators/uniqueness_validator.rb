class UniquenessValidator < ActiveRecord::Validations::UniquenessValidator
  def initialize(options)
    if options[:class] <= Components::FormObject
      options[:class] = options[:class].model_class
    end
    super options
  end

  def validate_each(record, attribute, value)
    if record.kind_of? Components::FormObject
      attribute_errors = record.model.errors[attribute]
      record.model.errors.delete attribute
      res = super record.model, attribute, value
      record.errors.add(attribute, record.model.errors[attribute])
      record.model.errors.add(attribute, attribute_errors)
      res
    else
      super
    end
  end
end