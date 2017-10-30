Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  get "/api/v1/tanks", to: "api/v1/tanks#index"
end
