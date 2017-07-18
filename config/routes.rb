Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  root to: "posts#index"

  resources :posts
  post "posts/:id" => "posts#create_comment", as: "posts_create_comment"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
