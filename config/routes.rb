Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :bible_books, only: [:index, :show]
      resources :categories, only: [:index, :show]
      resources :verses do
        resources :references, only: [:create, :destroy], controller: 'verse_references'
        member do
          get :texts
          post :fetch_texts
        end
      end
      resources :progressions, controller: 'verse_progressions' do
        resources :steps, only: [:create, :update, :destroy], controller: 'progression_steps'
      end
    end
  end

  # Health check for load balancers
  get "up" => "rails/health#show", as: :rails_health_check
end
