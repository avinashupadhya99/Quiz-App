class OptionsController < ApplicationController
  def new
    @option = Option.new
  end

  def create
    @option = Option.new(option_params)
    @question = Question.find(params[:option][:question_id].to_i)
    @option_all = Option.where(question_id: @question.id)
    can_save=true
    if @option_all.present?
      @option_all.each do |each_option|
        if each_option.opt_name==@option.opt_name
          can_save=false
        end
        if each_option.is_answer==true
          @answer=each_option
        end
      end
    end

    if can_save==false
      err_message = "Option "
      err_message.concat(@option.opt_name)
      err_message.concat(" already exists")
      flash[:danger] = err_message
      redirect_to controller: 'quizzes', action: 'show', id: @question.quiz_id
    else
      if @option.save
        if @option.is_answer==true && @answer.present?
          @answer.is_answer=false
          @answer.save
        end
        flash[:success] = "Option was successfully created"
        redirect_to controller: 'quizzes', action: 'show', id: @question.quiz_id
      else
        redirect_to controller: 'quizzes', action: 'show', id: @question.quiz_id
      end
    end
  end

  def edit
  end

  def update
    @each_option = Option.find(params[:id])
    @question = Question.find(@each_option.question_id)
    @option_all = Option.where(question_id: @question.id)
    can_save=true
    if @option_all.present?
      @option_all.each do |each_options|
        if each_options.opt_name==@each_option.opt_name
          can_save=false
        end
        if each_options.is_answer==true
          @answer=each_options
        end
      end
    end

    if can_save==false
      err_message = "Option \""
      err_message.concat(@each_option.opt_name)
      err_message.concat("\" already exists")
      flash[:danger] = err_message
      redirect_to controller: 'quizzes', action: 'show', id: @question.quiz_id
    else
      if @each_option.update(option_params)
        if @each_option.is_answer==true && @answer.present?
          @answer.is_answer=false
          @answer.save
        end
        flash[:success] = "Option was successfully updated"
        redirect_to controller: 'quizzes', action: 'show', id: @question.quiz_id
      else
        redirect_to controller: 'quizzes', action: 'show', id: @question.quiz_id
      end
    end
  end

  def show
  end

  def destroy
    @option = Option.find(params[:id])
    @question = Question.find(@option.question_id)
    @option.destroy
    flash[:danger] = "Option was successfully deleted"
    redirect_to controller: 'quizzes', action: 'show', id: @question.quiz_id
  end

  private

  def option_params

    params.require(:option).permit(:opt_name, :is_answer, :question_id)

  end
end
