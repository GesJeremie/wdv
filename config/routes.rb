Rails.application.routes.draw do

  constraints subdomain: 'www' do
    get ':any', to: redirect(subdomain: nil, path: '/%{any}'), any: /.*/
  end

  root 'home#index'

  resources :products, only: [:show]

  namespace :dashboard do
    resources :categories
    resources :products
  end

end

