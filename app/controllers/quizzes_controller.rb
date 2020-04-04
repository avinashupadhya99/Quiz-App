class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.all
  end
  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      flash[:success] = "Quiz was successfully created"
      redirect_to quiz_path(@quiz)
    else
      render 'new'
    end
  end

  def edit
    @quiz = Quiz.find(params[:id])
  end

  def update
    @quiz = Quiz.find(params[:id])

    if @quiz.update(quiz_params)
      flash[:success] = "Quiz was successfully updated"
      redirect_to quiz_path(@quiz)
    else
      render 'edit'
    end

  end

  def show
    @quiz = Quiz.find(params[:id])
    @question = Question.new
    @question_all = Question.where(quiz_id: params[:id].to_i)
    @total_score = Question.where(quiz_id: params[:id].to_i).sum(:score)
    @option = Option.new
    @option_all = Option.where(question_id: Question.where(quiz_id: params[:id].to_i))
  end

  def destroy
    @quiz = Quiz.find(params[:id])
    @question_all = Question.where(quiz_id: @quiz.id)
    if @question_all.present?
      @question_all.each do |each_question|
        @option_all = Option.where(question_id: each_question.id)
        if @option_all.present?
          @option_all.each do |each_option|
            each_option.destroy
          end
        end
        each_question.destroy
      end
    end
    @quiz.destroy
    flash[:danger] = "Quiz was successfully deleted"
    redirect_to quizzes_path
  end

  private

  def quiz_params

    params.require(:quiz).permit(:name)

  end
end
