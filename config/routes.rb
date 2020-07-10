Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/projects', to: 'projects#index'
  get '/projects/:id', to: 'projects#show'
  get 'contestants', to: 'contestants#index'
  patch '/projects/:id', to: 'projects#update'
end
