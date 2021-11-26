class Public::HomesController < ApplicationController
  def top
    if customer_signed_in? && current_customer.is_deleted == "退会"
      reset_session
      redirect_to root_path
    end
  end
end
