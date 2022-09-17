class CreditCardSerializer < ActiveModel::Serializer
  attributes :id, :name, :last_four, :exp_month, :exp_year
end
