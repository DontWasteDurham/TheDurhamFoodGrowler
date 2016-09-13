Rails.application.routes.draw do

  resources :restaurants
  resources :transactions
  root 'pages#landing'
  get 'welcome' => 'pages#welcome'
  get 'landing' =>'pages#landing'
  #Trying to get to a sign_out#
  #get 'users/sign_out' =>'devise/sessions#destroy'#

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
