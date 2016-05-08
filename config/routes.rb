Rails.application.routes.draw do

  get 'sessions/new'

  get 'admin/login'

  get 'admin/index'

  get 'admin/loan'

  namespace :admin do
    resources :books, :members
  end
  
  resources :admins
  resources :member
  
  root              'static_pages#home'
  get 'about'   =>  'static_pages#about'
  get 'contact' =>  'static_pages#contact'
  
  get 'member'   =>  'member#index'
  get 'admin'    =>   'admin#index'
  
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
  match 'admin/assign',      to: 'admin#assign',        via: 'post'
  match 'admin/returned',      to: 'admin#returned',        via: 'post'
  match 'member/renew', to: 'member#renew', via: 'post'
  
end
