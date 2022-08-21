Rails.application.routes.draw do
  resource :payment, only: [] do
    get :fulfill
    post :info
  end
end
