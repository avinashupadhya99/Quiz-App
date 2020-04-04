class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = "Question was successfully created"
      redirect_to controller: 'quizzes', action: 'show', id: params[:question][:quiz_id].to_i
    else
      redirect_to controller: 'quizzes', action: 'show', id: params[:question][:quiz_id].to_i
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
    @question = Question.find(params[:id])
    @quizID = @question.quiz_id
    @option_all = Option.where(question_id: @question.id)
    if @option_all.present?
      @option_all.each do |each_option|
        each_option.destroy
      end
    end
    @question.destroy
    flash[:danger] = "Question was successfully deleted"
    redirect_to controller: 'quizzes', action: 'show', id: @quizID
  end

  private

  def question_params

    params.require(:question).permit(:questions, :score, :quiz_id)

  end
end
