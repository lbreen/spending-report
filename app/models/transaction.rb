class Transaction < ApplicationRecord
  belongs_to :user

  validates :currency, inclusion: { in: %w(GBP EUR USD) }

  monetize :amount_cents

  def self.to_csv
    attributes = %w{description amount account category settled notes}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.find_each do |transaction|
        csv << attributes.map { |a| transaction.send(a) }
      end
    end
  end
end
