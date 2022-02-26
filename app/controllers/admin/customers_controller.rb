class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  PER = 10

  def index
    @customers = Customer.all.page(params[:page]).per(PER)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
    @customers = Customer.all
  end

  def update
    @customer = Customer.find(params[:id])

    if @customer.update(customer_params)
      flash[:createdflag] = true
      redirect_to admin_customer_path(@customer.id)
    else
      render:edit
    end

  end


private
  # ストロングパラメータ
  def customer_params
   params.require(:customer).permit(:name, :email, :is_deleted)
  end

end
