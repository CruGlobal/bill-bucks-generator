Rails.application.routes.draw do
  get 'bucks/img', to: 'bucks#img'
  get 'bucks/bill', to: 'bucks#img'
  get 'bucks/vonette', to: 'bucks#img'
  get 'bucks/new', to: 'bucks#new'

  root controller: :bucks, action: :new
end
