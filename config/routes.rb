Rails.application.routes.draw do
  devise_for :users
  
  root 'recommendations#home'

  get 'recommendations' => 'recommendations#index'

  get 'watching_recommendations' => 'watching_recommendations#index'

  get 'reading_recommendations' => 'reading_recommendations#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
