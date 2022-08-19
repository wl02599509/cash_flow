Rails.application.routes.draw do
  resource :pay, only: [:new, :create]
end
