Rails.application.routes.draw do
  resources :studies, :only => [:index, :show, :new, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "studies#index"


end
