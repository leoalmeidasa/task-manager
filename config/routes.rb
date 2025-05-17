Rails.application.routes.draw do
  resources :projects do
    resources :project_members, only: %i[index show new create destroy]
    resources :tasks
  end
  get "home/index"
  devise_for :users
  root "projects#index"
  get "up" => "rails/health#show", as: :rails_health_check
end
