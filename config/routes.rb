ShoeApp::Application.routes.draw do
  root to: 'static_pages#root'

  resources :users, only: [:new, :create, :edit, :update]
  resource :session, only: [:new, :create, :destroy]

  namespace :api, defaults: { format: :json } do
    resources :projects, except: [:new, :edit]
    resources :updates, only: [:create, :show]
    resources :project_fundings, only: [:create]
    resources :project_followings, only: [:create]
  end
end
