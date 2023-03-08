Rails.application.routes.draw do
  devise_for :users
  post 'ai_request', to: 'pages#ai_request'
  root to: "pages#home"

  get "/chat" => "pages#chat"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :channels do
    resources :chatroom_messages, only: :create
  end
end
