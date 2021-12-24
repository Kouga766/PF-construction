class Public::ItemsController < ApplicationController
  PER = 8

  def index

  end

  def real
   @items = Item.where(is_active: true).page(params[:page]).per(PER)
  end

  def animation
   @items = Item.where(is_active: false).page(params[:page]).per(PER)
  end

  def show
    @item = Item.find(params[:id])
    @reviews = @item.reviews
  end

end
