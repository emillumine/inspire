Rails.application.routes.draw do
  devise_for :users
  
  root 'recommendations#home'

  #get 'recommendations' => 'recommendations#index'
  #get 'recommendations/new' => 'recommendations#new'
  #post 'recommendations/new' => 'recommendations#create'
  resources :recommendations, only: [:index, :new, :create, :show, :update]

  #get 'reading_recommendations' => 'reading_recommendations#index'
  #get 'reading_recommendations/new' => 'reading_recommendations#new'
  #post 'reading_recommendations/new' => 'reading_recommendations#create'
  resources :reading_recommendations, only: [:index, :new, :create]

  get 'watching_recommendations' => 'watching_recommendations#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
