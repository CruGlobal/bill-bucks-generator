Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /montitors/lb that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # We use /monitors/lb
  get "monitors/lb", as: :rails_health_check

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
end
