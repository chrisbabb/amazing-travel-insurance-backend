class Customer < ApplicationRecord
  has_secure_password
  has_many :policies
  has_many :product, through: :policies
  has_many :additional_covereds, through: :policies
  has_many :credit_cards
end
