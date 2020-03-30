class QuizzesController < ApplicationController
  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      flash[:notice] = "Quiz was successfully created"
      redirect_to quiz_path(@quiz)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def delete
  end

  private

  def quiz_params

    params.require(:quiz).permit(:name, :score)

  end
end
