class Public::ReviewsController < ApplicationController

  def new
    @item = Item.find(params[:item_id])
    @review = Review.new
  end

  def create
    @item = Item.find(params[:review][:item_id])
    @review = current_customer.reviews.new(review_params)
    @review.item_id = @item.id
    review_count = Review.where(item_id: params[:review][:item_id]).where(customer_id: current_customer.id).count

    # バリデーションによるエラーがあるか判定
    if @review.valid?
      # バリデーションエラーが無い、且つレビューを一度もしたことない場合
      if review_count < 1
        @review.save
        redirect_to public_item_path(@item), notice: "レビューを保存しました"
      else
        redirect_to public_item_path(@item), notice: "レビューの投稿は一度までです"
      end
    else
      flash.now[:alert] = "レビューの保存に失敗しました"
      render :new
    end
  end

  def edit
    @item = Item.find(params[:item_id])
    @review = Review.find(params[:id])
    @reviews = Review.all

  end

  def update
    @item = Item.find(params[:review][:item_id])
    @review = Review.find(params[:id])
    @review.item_id = @item.id

    if @review.update(review_params)
      flash[:createdflag] = true
      redirect_to public_item_path(@item.id)
    else

      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to public_items_path
  end

private
  # ストロングパラメータ
  def review_params
   params.require(:review).permit(:name, :comment ,:image, :make, :appearance, :configuration, :precision, :price)

  end


end