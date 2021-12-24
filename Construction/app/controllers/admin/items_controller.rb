class Admin::ItemsController < ApplicationController
  # before_action :authenticate_admin!
PER = 10

  def index
     @items = Item.all.page(params[:page]).per(PER)

  end

  def new
     @item = Item.new
     @genre = Genre.all
  end

  def create

    @item = Item.new(item_params)
    #デフォルトで画像を設定
    @item.image = "default.png"

    if @item.save
      flash[:created] = true
      redirect_to admin_item_path(@item.id)
    else

      @genre = Genre.all

      render:new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit

    @item = Item.find(params[:id])
    @items = Item.all
    @genre = Genre.all
  end

  def update
     @item = Item.find(params[:id])

    if @item.update(item_params)
      flash[:createdflag] = true
      redirect_to admin_item_path(@item.id)
    else


      @genre = Genre.all

      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to admin_items_path
  end



private
  # ストロングパラメータ
  def item_params
   params.require(:item).permit(:name, :description ,:image, :price, :is_active, :genre_id, :scale, :sample_at)

  end


end
