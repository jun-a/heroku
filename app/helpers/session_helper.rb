module SessionHelper

  def home_session_check!
    set_count_session  # 表示用のsessionの代入
    reset_home_session  # home_sessionの初期化
  end

  # 表示用のcount_sessionの確認
  def set_count_session
    session[:member_count] = session[:member] - session[:home_member]
    session[:community_count] = session[:community] - session[:home_community]
    session[:event_count] = session[:event] - session[:home_event]
    session[:chat_count] = session[:chat] - session[:home_chat]
  end


  # 表示用のcount取得後にリセットさせる
  def reset_home_session
    session[:home_member] = session[:member]
    session[:home_community] = session[:community]
    session[:home_event] = session[:event]
    session[:home_chat] = session[:chat]
  end

  # 各ページにアクセスした場合に最新のカウントを取る
  def reset_count(c)
    case c.name
    when 'Member'
      session[:member] = Member.count
    when 'Community'
      session[:community] = Community.count
    when 'event'
      session[:event] = MembersEvent.where(member_id: current_member.id).count
    when 'MemberMessage'
      session[:chat] = MemberMessage.count
    end
  end

  # sign_up時の初期設定メソッド
  def initialize_count
    session[:member] = Member.count
    session[:community] = Community.count
    session[:event] = MembersEvent.where(member_id: current_member.id).count
    session[:chat] = MemberMessage.count
    initialize_session
  end

  # 初めてアクセスした人用のメソッド(initialize_countが呼ばれるとセットで呼ばれる)
  def initialize_session
    session[:home_member] = session[:member]
    session[:home_community] = session[:community]
    session[:home_event] = session[:event]
    session[:home_chat] = session[:chat]
  end
  # sessionのnilチェック
  def nil_session?
    if session[:member_count].nil? || session[:community_count].nil? || session[:event_count].nil? || session[:chat_count].nil?
      initialize_count
    end
  end
end
