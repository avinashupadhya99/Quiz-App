class OptionsController < ApplicationController
  def new
    @option = Option.new
  end

  def create
    @option = Option.new(option_params)
    if @option.save
      flash[:success] = "Option was successfully created"
      redirect_to controller: 'quizzes', action: 'show', id: params[:option][:question_id].to_i
    else
      redirect_to controller: 'quizzes', action: 'show', id: params[:option][:question_id].to_i
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
