class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end

    # ifオプション = 値にメソッド名にすることで、その戻り値がtrueであった場合のみに処理を行う。
    # 今回は :devise_controller? というdeviseのヘルパーメソッド名を指定してdeviseに関するコントローラの場合のみ処理を実行する。

    # devise_parameter_sanitizerメソッド = deviseにおけるparamsのようなメソッド。
    # ログイン、新規登録などのリクエストからパラメータを取得できる。
    # permitメソッドを組み合わせることで、deviseで定義されているストロングパラメータに対し、自分で新しく追加したカラムも指定して組み合わせることができる。