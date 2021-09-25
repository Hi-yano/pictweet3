class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show]  # resourcesと同様にonlyやexceptなどのオプションを使用することによって、どのアクションの実行前に処理を実行させるかなどの制限が可能になる
  
  def index
    @tweets = Tweet.all    # 「@」月のものはインスタンス変数。インスタンス変数の値は、コントローラとビューで共有される。
  end

  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(tweet_params) # privateメソッドの呼び出し
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end

  def edit
  end

  def update
    tweet = Tweet.find(params[:id])   # ビューファイルにツイート情報を渡す必要がないため、インスタンス変数は使用しない。
    tweet.update(tweet_params)        # データベースへのアップデート処理
  end

  def show
  end

  private
  def tweet_params
    params.require(:tweet).permit(:name, :image, :text)
    # railsのアプリケーションにおいてデータの保存や変更を行う際には、ストロングパラメータを用いることが定石。
    # ストロングパラメータ → params.require().permit()で、特定のキーを受け取るように制限。
    # requireメソッドは、どの情報を取得するか選択する。ストロングパラメーターとして利用する場合は、主にモデル名を指定する。
    # permitメソッドは、取得したいキーを指定でき、指定したキーと値のセットのみを取得する。
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])  # ビューファイルで使用する為、インスタンス変数に代入している。find = 「探す」
    # editアクションとshowアクションが実行される前に、set_tweetが実行される。
    # before_actionを用いることで重複した記述を一つにまとめることができる。
  end
  
end