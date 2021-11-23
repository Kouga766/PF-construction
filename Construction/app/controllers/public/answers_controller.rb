class Public::AnswersController < ApplicationController

  def index

  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:answer][:question_id])
    @answer = current_customer.answers.new(answer_params)
    @answer.question_id = @question.id
    answer_count = Answer.where(question_id: params[:answer][:question_id]).where(customer_id: current_customer.id).count
    #answer_count = @question.answers.where(customer_id: current_customer.id).count
    # バリデーションによるエラーがあるか判定
    if @answer.valid?
      # バリデーションエラーが無い、且つレビューを一度もしたことない場合
      if answer_count < 1
        @answer.save
        redirect_to public_question_path(@question), notice: "レビューを保存しました"
      else
        redirect_to public_question_path(@question), notice: "レビューの投稿は一度までです"
      end
    else
      flash.now[:alert] = "レビューの保存に失敗しました"
      render :new
    end
  end

  def edit

    @answer = Answer.find(params[:id])
    @answers = Answer.all

  end

  def update
     @answer = Answer.find(params[:id])

    if @answer.update(answer_params)
      flash[:createdflag] = true
      redirect_to public_question_path(@question.id)
    else

      render :edit
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to public_question_path
  end

private
  # ストロングパラメータ
  def answer_params
   params.require(:answer).permit(:name, :answer ,:image )

  end


end
