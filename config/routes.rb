Rails.application.routes.draw do


  get 'about' => 'pages#about'

  get 'faq' => 'pages#faq'

  resources:quizzes

  resources:questions

  resources:options

  resources:categories
  
  get 'question/edit' => 'quizzes#editQuestion'

  get 'option/edit' => 'quizzes#editOption'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
end
