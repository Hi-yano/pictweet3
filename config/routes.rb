Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'tweets#index'
  resources :tweets       #, only: [:index, :new, :create, :destroy, :edit, :update, :show]   # 7つのアクションを記述した場合はonlyオプションは不要になる。
  resources :users, only: :show   # users_controller.rbのshowアクションを実行するルーティングを設定した
end