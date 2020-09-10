Rails.application.routes.draw do


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end


  get 'tags/:tag', to: 'photos#index', as: :tag
  resources :photos do
    get :autocomplete_tag_name, :on => :collection
  end

  resources :photos

  get 'profile', to: 'users#profile'
  get 'search', to: 'search#search'
  root to: "pages#index"
end
