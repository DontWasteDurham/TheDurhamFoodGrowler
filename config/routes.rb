Rails.application.routes.draw do
  get 'welcome' => 'pages#welcome'

  get 'landing' =>'pages#landing'

  devise_for :businesses
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
