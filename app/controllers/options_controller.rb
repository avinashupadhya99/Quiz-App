class OptionsController < ApplicationController
  def new
    @option = Option.new
  end

  def create
    @option = Option.new(option_params)
    @question = Question.find(params[:option][:question_id].to_i)
    if @option.save
      flash[:success] = "Option was successfully created"
      redirect_to controller: 'quizzes', action: 'show', id: @question.quiz_id
    else
      redirect_to controller: 'quizzes', action: 'show', id: @question.quiz_id
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

  def option_params

    params.require(:option).permit(:opt_name, :question_id)

  end
end
