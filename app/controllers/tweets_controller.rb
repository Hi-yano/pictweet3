class TweetsController < ApplicationController
  def index
    @tweets = Tweets.all    # 「@」月のものはインスタンス変数。インスタンス変数の値は、コントローラとビューで共有される。
  end
end