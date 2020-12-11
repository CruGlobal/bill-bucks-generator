Rails
  .application
  .routes
  .draw do
    get 'bucks/img', to: 'bucks#img'
    get 'bucks/new', to: 'bucks#new'
    post 'bucks/generate', to: 'bucks#generate'

    get '/irt' => redirect('bucks/new?dept=irt')

    root controller: :bucks, action: :new
  end
