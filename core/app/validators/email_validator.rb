class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless /\A[^@\s]+@[^@\s]+\z/.match?(value)
      record.errors.add(attribute, :invalid, {value: value}.merge!(options))
    end
  end
end
