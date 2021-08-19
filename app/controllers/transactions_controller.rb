class TransactionsController < ApplicationController

  def index
    @transactions = Transaction.where(user: current_user)
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  private

  def transaction_params
   params.requre(:transaction).permit(:category, :account, :currency, :settled, :notes)
  end
end
