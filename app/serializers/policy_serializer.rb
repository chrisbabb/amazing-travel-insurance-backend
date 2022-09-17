class PolicySerializer < ActiveModel::Serializer
  attributes :id, :policy_number, :purchase_date, :start_date, :end_date
  has_one :product
  has_many :additional_covered
end
