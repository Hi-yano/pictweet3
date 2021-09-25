Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'tweets#index'
  resources :tweets       #, only: [:index, :new, :create, :destroy, :edit, :update, :show]   # 7つのアクションを記述した場合はonlyオプションは不要になる。
end