Rails.application.routes.draw do

  get 'subscriptions/new'
  put 'subscriptions/update'
  delete 'subscriptions/delete'
  get 'subscriptions/boxes'
  put 'subscriptions/add_boxes'


  resources :restaurants
  resources :transactions
  root 'pages#landing'
  get 'welcome' => 'pages#welcome'
  get 'landing' =>'pages#landing'
  get 'whygreenbox' => 'pages#whygreenbox'
  #Trying to get to a sign_out#
  #get 'users/sign_out' =>'devise/sessions#destroy'#
  get 'user' => 'users#show'

  devise_for :users, controllers: {registrations: "registrations"}
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
