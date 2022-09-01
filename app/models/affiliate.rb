class Affiliate < ApplicationRecord
  has_many :sub_affiliates
  has_many :policies
end
