Rails.application.routes.draw do
  get 'dreams/home'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
