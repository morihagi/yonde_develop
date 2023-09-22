Rails.application.routes.draw do
  root 'static_pages#top'
  get 'info', to: 'static_pages#info'
  get 'about', to: 'static_pages#about'
  get 'terms', to: 'modals#terms'
  get 'privacy_policy', to: 'modals#privacy_policy'

  devise_for :users,
              controllers: {
                omniauth_callbacks: 'users/omniauth_callbacks',
                registrations: 'users/registrations',
                confirmations: 'users/confirmations'
              }

  resources :posts do
    post 'duplicate', on: :member
    post 'update_status', on: :member
  end
  get 'show_for_guest_user', to: 'posts#show_for_unregistered_user', as: :show_for_guest_user
  resource :profile, only: %i[show edit update]
  get '/profile/edit_for_goods', to: 'profiles#edit_for_goods'
  resource :user, only: %i[show edit update]
end
