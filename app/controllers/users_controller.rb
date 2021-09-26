class UsersController < ApplicationController
  def show
    user = User.find(params[:id]) # 送られてきたidをparamsで取得。findメソッドで探し、変数userに代入
    @nickname = user.nickname     # それぞれインスタンス変数に格納 
    @tweets = user.tweets
  end
end
