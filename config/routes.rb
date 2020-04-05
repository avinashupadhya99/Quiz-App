Rails.application.routes.draw do


  get 'about' => 'pages#about'

  get 'faq' => 'pages#faq'

  resources:quizzes

  resources:questions

  resources:options

  get 'question/edit' => 'quizzes#editQuestion'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
end
