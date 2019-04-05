require "api_version_constraint"

Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: "api/v1/sessions"}
  namespace :api, defaults: {format: :json} do
    namespace :v1 , path: "/", constraints:ApiVersionConstraint.new(verison: 1, default: true)do
      resources :users
      resources :sessions
      resources :gains
      resources :outlay
    end
  end

end
