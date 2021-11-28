class Public::QuestionsController < ApplicationController
  PER = 8

  def index

  end

  def technology
   @questions = Question.where(is_Q: true).page(params[:page]).per(PER)
   @answer = Answer.all
  end

  def other
   @questions = Question.where(is_Q: false).page(params[:page]).per(PER)
   @answer = Answer.all
  end

  def show
    @question = Question.find(params[:id])
    @answers =@question.answers
  end

  def new
     @question = Question.new
  end

  def create

    @question = current_customer.questions.new(question_params)
    #デフォルトで画像を設定
    @question.image = "default.png"

    if @question.save
      flash[:created] = true
      redirect_to public_question_path(@question.id)
    else

      render:new
    end
  end

  def edit

    @question = Question.find(params[:id])
    @questions = Question.all

  end

  def update
     @question = Question.find(params[:id])

    if @question.update(question_params)
      flash[:createdflag] = true
      redirect_to public_question_path(@question.id)
    else

      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to public_questions_path
  end

private
  # ストロングパラメータ
  def question_params
   params.require(:question).permit(:name, :question ,:image, :is_Q )

  end


end

