Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root controller: :bucks, action: :new

  get "bucks/img", to: "bucks#img"
  get "bucks/new", to: "bucks#new"
  post "bucks/generate", to: "bucks#generate"

  get "/irt" => redirect("bucks/new?dept=irt")
  get "/login", to: "login#create"
  get "/logout", to: "login#clear"
  get "/login_callback", to: "login#callback"
  get "/login_error", to: "login#error"

  get "monitors/lb" => "monitors#lb"
end
