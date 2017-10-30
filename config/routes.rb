Rails.application.routes.draw do
  get "/api/v1/tanks", to: "api/v1/tanks#index"
end
