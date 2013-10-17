Landertastic::Application.routes.draw do
  root "home#index"
  get "/admin" => "admin/sessions#new"

  resources :leads, only: [:create, :index]

  namespace :admin do
    resources :sessions, only: [:new, :create]
    delete "/sessions" => "sessions#destroy"

    resources :statistics, only: [:index]
    delete "/statistics" => "statistics#destroy"

    resources :settings, only: [:index]
    patch "/settings" => "settings#update", as: "update_settings"
  end
end
