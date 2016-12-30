class EmailValidator < ActiveModel::EachValidator
  EMAIL_REGEXP = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def validate_each(record, attribute, value)
    unless value =~ EMAIL_REGEXP
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end