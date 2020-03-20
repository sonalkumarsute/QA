Rails.application.routes.draw do
  root "questions#index"
  resources :follows
  resources :topics
  resources :answers
  resources :questions
  devise_for :users
  match 'sfollow', to: 'follows#sfollow', via: [:post]
  #match 'topics', to: 'users#topics', via: [:get]
 # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
