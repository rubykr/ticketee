Ticketee::Application.routes.draw do

  devise_for :users

  root :to => "projects#index"
  
  resources :projects do
    resources :tickets
  end
  
  resources :tickets do
    resources :comments
  end
  
  resources :assets

  namespace :admin do
    root :to => "base#index"
    resources :users do
      resources :permissions
    end
    resources :states do
      member do
        get :make_default
      end
    end
  end
  
  match '/admin/users/:user_id/permissions', :to => 'admin/permissions#update', :as => :update_user_permissions
end

