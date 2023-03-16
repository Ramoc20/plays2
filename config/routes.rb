Rails.application.routes.draw do
  scope ':category', as: 'category' do
    resources :teams, only: [:show], param: :slug
  end

  # Move the search results route above the route with the :player_id parameter
  get '/players/search_results', to: 'players#search_results', as: :search_results
  get '/players/:player_id', to: 'players#show', as: :player

  get 'teams/show'

  scope '/nba' do
    resources :players, path: '/', only: [:show], constraints: { league: 'nba' }
  end

  resources :players do
    collection do
      get 'search'
    end
  end

  scope '/mlb' do
    resources :mlb_players, path: '/', only: [:show]
  end
end
