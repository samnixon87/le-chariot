Rails.application.routes.draw do
  resources :favourites
  devise_for :users
  post 'ai_request', to: 'pages#ai_request'
  root to: "pages#home"
  get "/chatgpt" => "pages#chatgpt"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :channels, param: :slug do
    resources :issues, only: [:new, :index, :show, :create]
  end

  resources :issues do
    resources :messages, only: :create
  end

  resources :messages do
    resources :favourites, only: [:create, :destroy]
  end
end
