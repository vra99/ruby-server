Rails.application.routes.draw do
  # change home page
  root 'home#index'
  post "/auctions", to: "auctions#index"
end
