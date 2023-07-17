Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  # get 'login', to: 'user_sessions#new'
  # post 'login', to: 'user_sessions#create'
  # delete 'logout', to: 'user_sessions#destroy'

  root 'static_pages#top'

  resources :users, only: %i[new create]
end
