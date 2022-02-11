Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'fibonacci-values/:index', to: 'fibonacci_values#show', as: 'fibonacci_values'
end
