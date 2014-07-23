ShoeApp::Application.routes.draw do
  root to: 'static_pages#root'

  namespace :api, defaults: { format: :json } do
  end
end
