Rails.application.routes.draw do
  devise_for :users, skip: [:registrations, :sessions, :passwords]
  devise_scope :user do
    post 'users/sign-up', to: 'devise/registrations#create', as: :registration
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
