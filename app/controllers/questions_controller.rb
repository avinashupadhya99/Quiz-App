class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      @option = Option.new(:opt_name => params[:question][:answer], :question_id => @question.id)
      @option.save
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

  def delete
  end

  private

  def question_params

    params.require(:question).permit(:questions, :answer, :score, :quiz_id)

  end
end
