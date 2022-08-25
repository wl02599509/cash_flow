class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :donate_item
end
