Rails.application.routes.draw do

  get 'quiz/new'

  get 'quiz/create'

  get 'quiz/edit'

  get 'quiz/update'

  get 'quiz/show'

  get 'quiz/delete'

  get 'about' => 'pages#about'

  get 'faq' => 'pages#faq'

  resources 'quiz'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
end
