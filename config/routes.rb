# frozen_string_literal: true

Rails.application.routes.draw do
  resources :answers
  namespace :api, { format: 'json' } do
    namespace :v1 do
      resources :users
      resources :workbooks
      resources :preference_relationships, only: %i[create destroy show]
      resources :questions
      get 'workbooks/:id/upload', to: 'workbooks#upload'
      post 'login', controller: :sessions, action: :create
      delete 'logout', controller: :sessions, action: :destroy
      post 'refresh', controller: :refresh, action: :create
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
