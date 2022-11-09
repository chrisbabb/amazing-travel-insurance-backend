class CustomerSerializer < ActiveModel::Serializer
    attributes :id, :first_name, :last_name, :user_level, :email, :password_digest, :address, :city, :state, :postal_code, :phone, :dob
    has_many :credit_cards
    has_many :policies
    has_one :product, through: :policies
    has_many :additional_covereds, through: :policies
  end
  