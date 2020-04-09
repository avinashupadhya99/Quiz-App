class SubmissionsController < ApplicationController

	def new

	end

	def create
		@submission = Submission.new(submission_params)
	    if @submission.save
	      flash[:success] = "Quiz was submitted succesfully"
	      redirect_to controller: 'quizzes', action: 'index'
	    else
	    	flash[:danger] = "Soemthing went wrong"
			redirect_to controller: 'quizzes', action: 'show', id: params[:quiz_id].to_i
	    end
	end

	def destroy

	end

	private

    def submission_params

		params.require(:submission).permit(:user_id, :quiz_id)

	end
end