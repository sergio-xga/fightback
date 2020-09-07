Rails.application.routes.draw do
  root 'web_app#landing'
  resources :projects do
    resources :donations
  end
  get '*all', to: 'web_app#landing', constraints: lambda { |req|
    req.path.exclude? 'rails/active_storage'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
