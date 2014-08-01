ShoeApp::Application.routes.draw do
  root to: 'static_pages#root'

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy] do
    get :guest
  end


  namespace :api, defaults: { format: :json } do
    resources :projects, except: [:new, :edit] do
      member do
        get :followers
        get :funders
      end
    end

    resources :updates, only: [:create, :show]
    resources :comments, only: [:create]
    resources :project_fundings, only: [:create]
    resources :project_followings, only: [:create]
    resources :users, only: [:show, :update]
  end
end
