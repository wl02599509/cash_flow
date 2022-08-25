Rails.application.routes.draw do
  resource :payment, only: [] do
    get :fulfill
    post :info
  end

  get '/payments/returnpage', 'payments#returnpage'
end
