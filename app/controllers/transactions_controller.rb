class TransactionsController < ApplicationController

  def index
    @transactions = Transaction.where(user: current_user)

    respond_to do |format|
      format.html
      format.csv { send_data @transactions.to_csv, filename: "transactions-#{Date.today}.csv" }
    end
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  private

  def transaction_params
   params.requre(:transaction).permit(:category, :account, :currency, :settled, :notes)
  end

  # def export_to_csv

  # end
end
