Rails.application.routes.draw do
  resources :studies, :only => [:index, :show, :new, :create, :edit, :update, :delete]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :studies, only: [:show] do
    get '/:point_id', to: 'studies#activate', as: 'point'
  end

  root "studies#index"


end
