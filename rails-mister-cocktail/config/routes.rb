Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'cocktails#index'

  resources :cocktails, as: :cocktails do
    resources :doses, only: %i[show index new create destroy], as: :doses
  end

  resources :ingredients, only: %i[new create destroy], as: :ingredients
end
