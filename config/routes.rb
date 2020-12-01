Rails.application.routes.draw do
  get 'bucks/img', to: 'bucks#img'
  get 'bucks/new', to: 'bucks#new'
  post 'bucks/generate', to: 'bucks#generate'

  root controller: :bucks, action: :new
end
