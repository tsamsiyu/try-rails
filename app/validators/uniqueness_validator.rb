class UniquenessValidator < ActiveRecord::Validations::UniquenessValidator
  def initialize(options)
    if options[:class] <= Components::Form
      options[:class] = options[:class].model_class
    end
    super options
  end

  def validate_each(record, attribute, value)
    if record.kind_of? Components::Form
      record = record.model
    end
    super record, attribute, value
  end
end