class CategoriesController < ApplicationController

	before_action :require_user, except: [:index, :show]
  	before_action :require_admin, except: [:index, :show]

	def index
		@categories = Category.paginate(page: params[:page], per_page: 6)
		
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:success] = "Category was successfully created"
			redirect_to categories_path
		else
			render 'new'
		end
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])
		if @category.update(category_params)
			flash[:success]="Category name was updated successfully"
			redirect_to categories_path(@category)
		else
			render 'edit'
		end
	end

	def show
		@category = Category.find(params[:id])
		quizzes = Quiz.where(id: Question.select("quiz_id").group(:quiz_id).having("count(id)>1"))
		category_quiz = @category.quizzes
		@category_quizzes = []
		category_quiz.each do |quiz|
			if quizzes.include?(quiz)
				@category_quizzes.push(quiz)
			end
		end

		@category_quizzes = @category_quizzes.paginate(page: params[:page], per_page: 6)
	end

	private

	def category_params
		 params.require(:category).permit(:name)
	end

end
