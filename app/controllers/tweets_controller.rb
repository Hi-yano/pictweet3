class TweetsController < ApplicationController
  
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
    @tweet = Tweet.find(params[:id])  # find = 探す
  end

  def update
    tweet = Tweet.find(params[:id])   # ビューファイルにツイート情報を渡す必要がないため、インスタンス変数は使用しない。
    tweet.update(tweet_params)        # データベースへのアップデート処理
  end

  private
  def tweet_params
    params.require(:tweet).permit(:name, :image, :text)
    # railsのアプリケーションにおいてデータの保存や変更を行う際には、ストロングパラメータを用いることが定石。
    # ストロングパラメータ → params.require().permit()で、特定のキーを受け取るように制限。
    # requireメソッドは、どの情報を取得するか選択する。ストロングパラメーターとして利用する場合は、主にモデル名を指定する。
    # permitメソッドは、取得したいキーを指定でき、指定したキーと値のセットのみを取得する。
  end
  
end