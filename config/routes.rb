Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  root 'static_pages#top'
  get '/modals/terms', to: 'modals#terms'
  get '/modals/privacy_policy', to: 'modals#privacy_policy'

  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  resources :posts do
    get 'draft', to: 'gmails#post_draft'
    get 'send', to: 'gmails#post_send'
  end
  get 'auth/:provider/callback', to: 'gmails#gmail_api'
  get 'auth/failure', to: redirect('/')
  resource :profile, only: %i[ show edit update ]
  get '/profile/edit_for_goods', to: 'profiles#edit_for_goods'
  resource :user, only: %i[ show  edit update ]
end
