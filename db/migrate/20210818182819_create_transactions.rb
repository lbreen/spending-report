class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :category
      t.string :account
      t.string :currency
      t.datetime :settled
      t.text :notes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_monetize :transactions, :amount, currency: { present: false }
  end
end
