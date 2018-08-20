Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :surveys do
    resources :questions do
      resources :answers
    end

    resources :survey_responses
  end

  root 'surveys#index'

end
