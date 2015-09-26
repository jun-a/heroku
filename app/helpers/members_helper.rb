module MembersHelper
  private

    # ユーザー状態の明記
    def loging_member
      @current_member ||= Member.find(session['devise.google_data']) if session['devise.google_data'].present?
    end

    def require_member_login!   # ログインして「いない」場合の判定なので、否定の!をメソッドの最後にもちいる
      if @current_member.blank?
        redirect_to new_member_session_path # ここはdevise_forで生成されるpathの指定
        return  # メソッドが判定を決める処理をを行うため、if文の実行結果をメソッドに返してあげる
      end
    end
end
