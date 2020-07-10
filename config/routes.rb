Rails.application.routes.draw do
  get  '/projects/:project_id/contestant_projects', to: 'contestant_projects#new'
  post '/projects/:project_id/contestant_projects', to: 'contestant_projects#create'
  get  '/projects/:id',                             to: 'projects#show'
  get  '/contestants',                              to: 'contestants#index'
end
