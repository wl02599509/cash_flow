Rails.application.routes.draw do
  resource :payment, only: [] do
    get :fulfill
    post :encode_trade_info
  end
end
