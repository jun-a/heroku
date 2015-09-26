module AdminUserLoginsHelper
  private

    # 情報の保持状態を作って権限機能の付与
    def login_admin_user?
      @admin_user ||= AdminUser.find(session[:admin_user_id]) if session[:admin_user_id].present?
    end

    def require_admin_login!   # ログインして「いない」場合の判定なので、否定の!をメソッドの最後にもちいる
      if @admin_user.blank?
        redirect_to login_admin_user_login_path
        return  # メソッドが判定を決める処理をを行うため、if文の実行結果をメソッドに返してあげる
      end
    end
end
