class Admin::GenresController < ApplicationController
# before_action :authenticate_admin!

  def index
    @genres = Genre.all
    @genre = Genre.new

  end

  def create
     @genre = Genre.new(genre_params)

    if @genre.save

      #createflag＝trueは、ジャンルを作りShowページに飛んだときに動くように定義
      flash[:createdflag] = true
      redirect_to admin_genres_path(@genre.id)
    else
      @genres = Genre.all
      render:index
    end
  end

  def edit
      @genre = Genre.find(params[:id])

  end

  def update
       @genre = Genre.find(params[:id])

    if @genre.update(genre_params)
      flash[:createdflag] = true
      flash[:notice]= "You have updated user successfully."

      redirect_to admin_genres_path(@genre.id)

    else
      #updateを失敗すると編集ページへ
      render:edit

    end
  end

 private
  def genre_params
    params.require(:genre).permit(:name)
  end


end
