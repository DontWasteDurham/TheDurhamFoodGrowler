Rails.application.routes.draw do

  root 'pages#landing'
  get 'welcome' => 'pages#welcome'
  get 'landing' =>'pages#landing'
  resources :charges
  #Trying to get to a sign_out#
  #get 'users/sign_out' =>'devise/sessions#destroy'#

  devise_for :businesses
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
