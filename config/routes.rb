Rails.application.routes.draw do
  get "projects_members/index"
  get "projects_members/show"
  get "projects_members/new"
  get "projects_members/create"
  get "projects_members/edit"
  get "projects_members/update"
  get "projects_members/destroy"
  resources :projects do
    resources :project_members, only: %i[index show new create destroy]
    resources :tasks
  end
  get "home/index"
  devise_for :users
  root "home#index"
  get "up" => "rails/health#show", as: :rails_health_check
end
