Rails.application.routes.draw do
  resource :payment, only: [] do
    get :fulfill
    post :info
    post :returnpage
  end
end
