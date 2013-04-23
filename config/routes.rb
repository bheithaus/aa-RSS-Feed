RssFeed::Application.routes.draw do
  root to: "feeds#index"

  resources :feeds
  resources :entries
end