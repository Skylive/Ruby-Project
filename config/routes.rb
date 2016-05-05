Rails.application.routes.draw do
  
  resources :members
  root              'static_pages#home'
  get 'about'   =>  'static_pages#about'
  get 'contact' =>  'static_pages#contact'
  
end
