Rails.application.routes.draw do
  resources :dashboards
  get 'single_graph' => 'graph#single_graph', :defaults => { :format => 'json' }

  devise_for :dashboard_users
  resources :dashboard_users, :only => [:show]

  authenticated :dashboard_user do
    root :to => 'dashboard_users#show'
  end

  unauthenticated do
    root :to => 'home#index', as: :unauthenticated_root
  end
end
