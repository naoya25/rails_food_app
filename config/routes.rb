Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/foods/index", to: "foods#index"
  post "/foods/read", to: "foods#read"
end
