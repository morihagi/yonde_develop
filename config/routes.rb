Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  root 'static_pages#top'
  devise_for :users, 
              controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
                            registrations: 'users/registrations'
                            }
end
