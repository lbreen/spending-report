class Transaction < ApplicationRecord
  belongs_to :user

  validates :currency, inclusion: { in: %w(GBP EUR USD) }

  monetize :amount_cents
end
