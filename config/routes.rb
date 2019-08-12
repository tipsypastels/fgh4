Rails.application.routes.draw do
  namespace :api do
    scope '/mentions' do
      get '/users', to: 'mentions#users', as: :mentionable_users
      get '/recordings', to: 'mentions#recordings', as: :mentionable_recordings
    end
  end

  get '/todo', to: 'docs#todo'
  get '/faq', to: 'docs#faq'
  get '/tos', to: 'docs#tos'

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'signup',
  }

  resources :shouts, except: :show do
    member do
      patch '/bump', to: 'shouts#bump', as: :bump
    end
    
    collection do
      patch '/dismiss', to: 'shouts#dismiss', as: :dismiss
    end
  end

  get '/settings', to: 'settings#edit', as: :settings
  patch '/settings', to: 'settings#update'

  resources :tags, only: %i|index show|

  get '/new', to: 'recordings#new', as: :new_recording_options
  get '/new/:type', to: 'recordings#new', as: :new_recording
  get '/:id/edit', to: 'recordings#edit', as: :edit_recording
  
  get '/@:id', to: 'users#show', as: :user

  resources :recordings, only: %i|create|
  
  get '/:id', to: 'recordings#show', as: :recording
  patch '/:id', to: 'recordings#update'
  
  root to: 'recordings#index'
end
