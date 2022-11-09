Rails.application.routes.draw do
  resources :rater, :customer, :credit_card, :product, :policy, :additional_covered
  post "/signup", to: "users#create"
  post "/login", to: "session#create"
  get "/authorized", to: "session#show"
end
