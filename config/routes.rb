Rails.application.routes.draw do
  root 'skool#index'

  resources :schools do
    resources :students
  end
end
