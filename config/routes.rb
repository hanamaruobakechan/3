Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root to: "homes#top"
resources :books, only: [:create, :index, :show, :edit, :update, :destroy] do
  resource :favorites, only: [:create, :destroy]
  resources :book_comments, only: [:create, :destroy]
end

resources :users, only: [:create, :index, :show, :edit, :update]
get '/home/about' => 'abouts#about'

end
