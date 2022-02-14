Rails.application.routes.draw do

  # getメソッドを受け取るとき
  get 'static_pages/home'
  get 'static_pages/help'

  get 'static_pages/about'
end
