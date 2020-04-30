# frozen_string_literal: true

Rails.application.routes.draw do
  resources :workbooks
  namespace :api, { format: 'json' } do
    namespace :v1 do
      resources :users
      post 'signin', controller: :sessions, action: :create
      delete 'signin', controller: :sessions, action: :destroy
      post 'refresh', controller: :refresh, action: :create
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
