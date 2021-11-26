class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find_by(id: current_customer.id)
  end

  def cancel
  end

  def withdraw
    current_customer.update(is_deleted: "退会")
    reset_session
    redirect_to root_path
  end

  def edit
    @customer = Customer.find_by(id: current_customer.id)
  end

  def update
    @customer = Customer.find_by(id: current_customer.id)
    if @customer.update(customer_params)
      flash[:createdflag] = true
      redirect_to public_customers_path
    else
      render:edit
    end
  end

  private
  # ストロングパラメータ
  def customer_params
   params.require(:customer).permit(:name, :email)
  end
end
