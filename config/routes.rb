Rails.application.routes.draw do
  root 'web_app#landing'
  resources :projects do
    resources :donations
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
