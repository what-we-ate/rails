Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks", registrations: "registrations" }

  resource :user, except: [:new, :create, :destroy] do
    collection do
      get "delete"
      get "edit_password"
      patch "update_password"
    end
  end

  resource :identity, only: :destroy

  resources :events, only: :show do
    resources :bookings, only: [:create]
  end

  namespace :admin do
    resources :events
    resources :hosts

    root "pages#dashboard"
  end

  root "pages#home"

  get "/404", to: "errors#not_found"
  get "/500", to: "errors#internal_error"
end
