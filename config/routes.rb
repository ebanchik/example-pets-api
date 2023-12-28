Rails.application.routes.draw do
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"
  post "/pets" => "pets#create"
  get "/pets/:id" => "pets#show"
  get "/pets" => "pets#index"
end
