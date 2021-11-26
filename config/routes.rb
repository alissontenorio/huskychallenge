Rails.application.routes.draw do
  root :to => 'welcome#index'

  get 'auth/login', to: 'auth#login'
  get 'auth/log_out', to: 'auth#log_out'
  get 'auth(/:id)', to: 'auth#auth', as: 'auth'

  resources :invoices, only: [:index, :new, :create, :show] do
    get :send_email, on: :member
    resource :download, only: [:show], :controller => "invoices/downloads"
  end

  resources :users, only: [:new, :create]
end
