class JsonConstraint
    def matches?(request)
      request.format.json? && request.xhr?
    end
end

Rails.application.routes.draw do

  constraints subdomain: 'www' do
    get ':any', to: redirect(subdomain: nil, path: '/%{any}'), any: /.*/
  end

  root 'home#index'

  get 'order', to: 'orders#show'

  scope format: true, constraints: JsonConstraint.new do
    resources :products, only: [:show]
    resources :cart_products, only: [:create, :update, :destroy]
    resource :cart, only: [:show, :destroy]
  end

  namespace :dashboard do
    resources :categories
    resources :products
  end
end

