Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :bible_books, only: [:index, :show]
      resources :categories
      resources :tags, only: [:index]
      resources :verses do
        resources :references, only: [:create, :destroy], controller: 'verse_references'
        member do
          get :texts
          post :fetch_texts
          delete 'texts/:version', to: 'verses#delete_text', as: :delete_text
        end
      end
      resources :verse_texts, only: [] do
        collection do
          get :status
          post :batch_fetch
        end
      end
      resources :progressions, controller: 'verse_progressions' do
        resources :steps, only: [:create, :update, :destroy], controller: 'progression_steps' do
          collection do
            post :reorder
          end
        end
      end
    end
  end

  # Health check for load balancers
  get "up" => "rails/health#show", as: :rails_health_check
end
