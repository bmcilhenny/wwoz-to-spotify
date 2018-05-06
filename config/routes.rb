Rails.application.routes.draw do

  root 'songs#index'

  get '/restclient' => 'songs#hit_byebug'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
