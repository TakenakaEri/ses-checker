Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.


  # Deviseとオムニオース用のルート
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # ルートパスをanalyzerコントローラーのindexアクションに設定
  root 'analyzer#index'

  # 診断用のPOSTルート
  post '/analyze', to: 'analyzer#analyze'
  get '/users/auth/google_oauth2/callback', to: 'users/omniauth_callbacks#google_oauth2'

  # Railsのヘルスチェック用ルート
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
