Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'ideas', to: 'home#index', as: 'ideas'
  root :to => "home#index"
end
