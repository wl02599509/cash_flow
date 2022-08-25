class User < ApplicationRecord
  has_many :transaction
  has_many :donate_items, through: :transaction

end

