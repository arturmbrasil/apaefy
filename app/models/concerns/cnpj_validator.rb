class CnpjValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless CNPJ.valid?(value)
      record.errors.add(attribute, 'não é válido')
    end
  end
end
