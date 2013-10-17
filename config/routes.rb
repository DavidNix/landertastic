Landertastic::Application.routes.draw do
  root "home#index"
  get "/admin" => "admin/sessions#new"

  resources :leads, only: [:create, :index]

  namespace :admin do
    resource :sessions, only: [:new, :create, :destroy]
    resource :statistics, only: [:show, :destroy]
    resource :settings, only: [:edit, :update]
  end
end
