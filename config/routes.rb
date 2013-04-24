RssFeed::Application.routes.draw do
  root to: "feeds#index"

  resources :feeds do
    resources :entries, only: [:index]
  end
  resources :entries
end