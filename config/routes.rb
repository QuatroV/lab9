Rails.application.routes.draw do
  get 'index/input'
  get 'index/output'
  root 'index#input'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
