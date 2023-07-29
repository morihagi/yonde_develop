Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  root 'static_pages#top'
  get '/modals/terms', to: 'modals#terms'
  get '/modals/privacy_policy', to: 'modals#privacy_policy'

  devise_for :users, 
              controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
                            registrations: 'users/registrations'
                            }

  resources :posts
  resources :segments do
    get 'segments', on: :member
  end
  resource :profile, only: %i[ show edit update ]
  get '/profile/edit_for_goods', to: 'profiles#edit_for_goods'
  resource :user, only: %i[ show  edit update ]
end
