class Customer < ApplicationRecord
  has_many :policies
  has_many :credit_cards
end
