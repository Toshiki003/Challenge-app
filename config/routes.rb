Rails.application.routes.draw do
  get 'challenge/index'
  get 'challenge/new'
  get 'challenge/show'
  root 'home#top'

end
