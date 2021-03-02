Rails.application.routes.draw do
  resources :posts, except: [:destroy]
  resources :destinations, only: [:show]
  resources :bloggers, only: [:index, :new, :create, :show]
  
  patch '/posts/:id/like', to: 'posts#like', as: 'like'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
