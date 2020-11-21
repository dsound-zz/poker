class BankAccountsController < ApplicationController
  before_action :find_bank_account, only: [:show, :update, :delete]
 
def index
    @bank_accounts = BankAccount.all
    render :json => @bank_accounts
  end

  def show
    render :json => @bank_account
  end

  def create
    @bank_account = BankAccount.create(bank_account_params)
    if @bank_account.save
      render :json => @bank_account, status: @ok  
    else   
      render :json => { errors: @bank_account.errors.full_messages }, status: @unprocessible_entity
    end 
  end

  def update
    @bank_account = BankAccount.update(bank_account_params)
    if @bank_account.save 
      render :json => @bank_account, status: @ok 
    else  
      render :json => { errors: @bank_account.errors.full_messages }, status: @unprocessible_entity
    end
  end

  def destroy
     if @bank_account.delete  
        render :json => "bank_account deleted" 
     else   
        render :json => "Unable to delete"
     end

  end

  private 

  def find_bank_account
    @bank_account = BankAccount.find(params[:id]) 
  end

  def bank_account_params
    params.permit(:name, :player_count, :player_id, :id)
  end
end


