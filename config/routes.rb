Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :projects, except: [:update, :destroy] do      # allow project list, details and create
    # get :another_page
    # use the above routes if we need more pages
  end
end
