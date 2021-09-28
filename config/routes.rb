Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'tweets#index'
  resources :tweets do  #, only: [:index, :new, :create, :destroy, :edit, :update, :show]   # 7つのアクションを記述した場合はonlyオプションは不要になる。
    resources :comments, only: :create  # ルーティングにネストを使用しなければ、モデルと結びついている別モデルのid情報が送れなくなる。ルーティングをネストさせる一番の理由は、レコードのidをparamsに追加してコントローラに送るため。
    collection do   # collectionを使用すると、生成されるルーティングのURLと実行されるコントローラを任意にカスタムできる。（似たものにmemberがある）
      get 'search'
    end
  end
  resources :users, only: :show   # users_controller.rbのshowアクションを実行するルーティングを設定した
end