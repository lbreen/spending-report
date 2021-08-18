class Transaction < ApplicationRecord
  belongs_to :user

  validates :currency, inclusion: { in: 'GBP', 'EUR', 'USD' }

  monetize :price_cents
end
