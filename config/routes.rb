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

  scope format: true, constraints: JsonConstraint.new do
    resources :products, only: [:show]
  end

  namespace :dashboard do
    resources :products
  end
end

