Rails.application.routes.draw do
  post '/register', to: 'users/registrations#create', as: :registration
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
