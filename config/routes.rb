Rails.application.routes.draw do
  get 'users/new'
  # get 'users/new'

  # root "application#hello"
  root "static_pages#home"

  # pathを通す
  # 使うときはstatic_pages_help_path
  # get 'static_pages/help'
  # get 'static_pages/about'
  # get 'static_pages/contact'
  
  # 使うときは /help_path に省略できる
  get "/help", to: 'static_pages#help' #, as: "helf" # helf_pathとして使う
  get "/about", to: 'static_pages#about'
  get "/contact", to: 'static_pages#contact'
  get "/signup", to: "users#new"

  resources :users
end
