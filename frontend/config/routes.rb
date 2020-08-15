Rails.application.routes.draw do
  get "auth/discord/callback" => "session#create"
  get "card/gallery/:set/:id" => "card#gallery"
  get "card/:set/:id" => "card#show"
  get "card/:set/:id/:name" => "card#show"
  get "card" => "card#index"
  get "set/:id/verify_scans" => "set#verify_scans"
  get "set/:id/missing_scans" => "set#missing_scans"
  get "set/:id" => "set#show"
  get "set" => "set#index"
  get "artist/:id" => "artist#show"
  get "artist" => "artist#index"
  get "event" => "event#index"
  post "event/create" => "event#create"
  get "event/:id" => "event#show"
  get "event/:id/edit" => "event#edit"
  post "event/:id/edit" => "event#edit"
  get "event/:id/set-state/:state" => "event#set_state"
  get "format/:id" => "format#show"
  get "format" => "format#index"
  get "help/syntax" => "help#syntax"
  get "help/rules" => "help#rules"
  get "help/contact" => "help#contact"
  get "list" => "card#list"
  get "logout" => "session#destroy"
  get "deck/crawl/:id" => "deck#show_crawl"
  get "deck/ech/:id" => "deck#show_ech"
  get "deck/:set/:id" => "deck#show"
  get "deck/:set/:id/download" => "deck#download"
  get "deck/visualize" => "deck#visualize"
  post "deck/visualize" => "deck#visualize"
  get "deck" => "deck#index"
  get "sealed" => "sealed#index"
  get "xmage" => "xmage#index"
  get "xmage/config.json" => "xmage#xmage_config"
  get "xmage/news" => "xmage#news"
  get "xmage/todo" => "xmage#todo"
  get "xmage/vote/:name" => "xmage#vote"
  get "exh" => "xmage#exh_index"
  get "exh/news" => "xmage#exh_news"
  get "exh/todo" => "xmage#exh_todo"
  get "exh/vote/:name" => "xmage#vote"
  get "preferences" => "session#preferences"
  post "preferences" => "session#preferences"
  get "download" => "downloads#index"
  get "/" => "card#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
