class DonateItem < ApplicationRecord
  has_many :transaction
  has_many :user, through: :transaction
end
