ShoeApp::Application.routes.draw do
  root to: 'static_pages#root'

  resources :users, only: [:new, :create, :edit, :update]
  resource :session, only: [:new, :create, :destroy]

  namespace :api, defaults: { format: :json } do
    resources :projects, except: [:new, :edit]
  end
end
