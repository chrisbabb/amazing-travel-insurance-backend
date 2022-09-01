class SubAffiliate < ApplicationRecord
  belongs_to :affiliate
  has_many :policies
end
