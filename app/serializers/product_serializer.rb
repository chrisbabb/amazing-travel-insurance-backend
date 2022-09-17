class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :coverage_level, :price, :fee, :price_total, :policy_id
end
