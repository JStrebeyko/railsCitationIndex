Rails.application.routes.draw do
  get 'welcome/index'
  resources :citations do
    resources :comments
  end

  root 'citations#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
