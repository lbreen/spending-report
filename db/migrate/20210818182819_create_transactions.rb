class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :category, default: ''
      t.string :description, default: ''
      t.string :account, default: ''
      t.string :currency, default: ''
      t.datetime :settled, default: ''
      t.text :notes, default: ''
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_monetize :transactions, :amount, currency: { present: false }
  end
end
