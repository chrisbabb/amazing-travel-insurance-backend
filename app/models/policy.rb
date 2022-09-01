class Policy < ApplicationRecord
  has_many :additional_covered
  has_one :product
  belongs_to :affiliate
  belongs_to :sub_affiliate
end
