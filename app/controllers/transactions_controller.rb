class TransactionsController < ApplicationController

  def index
    @transactions = Transaction.where(user: current_user)
  end

  private

  def transaction_params
   params.requre(:transaction).permit(:category, :account, :currency, :settled, :notes)
  end
end
