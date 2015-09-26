Rails.application.routes.draw do

  get 'chats/index'
  get 'chats/to_message'

  # RESTfulなURLを自動生成してくれるresources

  #基本ページ系のルーティング
  root to: 'home#top_page'
  resource :home, path: '',  only: [] do
    get 'welcome' => 'home#welcome', as: 'welcome'
    get 'my_page' => 'home#index',  as: 'my_page'
    get 'top_page' => 'home#top_page', as: 'top_page'
    get 'contact_list' => 'home#contact_list', as: 'contact_list'
    get 'tutorial' => 'home#tutorial', as: 'tutorial'
  end


  #user系のルーティング
  resources :members
  resources :events
  post 'events/add_member' => 'events#add_member', as: 'event_add_member'


  #member_messageのルーティング
  resources :member_messages


  #deviseのroutes設定
  devise_for :members, path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout'
    }, controllers: {
    # membersのomniauth_callbackというコントローラにルーティングします
    omniauth_callbacks: "members/omniauth_callbacks"}

  #community系のルーティング
  resources :communities, except: [:add_member] do
  end
  post 'communities/add_member' => 'communities#add_member', as: 'community_add_member'
  #シャッフルコミュニティの生成
  get 'set_shuffle' => 'communities#set_shuffle', as: 'community_set_shuffle'
  post 'shuffle_community' => 'communities#shuffle_community', as: 'community_shuffle_communityr'

  resources :community_comments

  #about rejobook_news routing
  resources :news, controller: :rejobook_news
  post "news/create_news_comment" => 'rejobook_news#create_news_comment', as: 'create_news_comment'
  #get '*path', controller: 'application', action: 'render_404'

  #admin管理画面用のルーティング
  resource :admin_users, only: [] do
    get  'member_index',  to: 'admin_users#member_index'
    get  'community_index',  to: 'admin_users#community_index'
    get  'message_index',  to: 'admin_users#message_index'
    get  'news_index',  to: 'admin_users#news_index'
    get  'index',  to: 'admin_users#index'
  end

  #お問い合わせ用ルーティング
  get 'contact', to: 'contacts#contact'
  post 'contact/post_contact', to: 'contacts#post_contact'

  #resources :articles
  get 'articles/all_index'
  get 'articles/facebook_index'
  get 'articles/show'

  get 'news/delete_comment/:comment_id/:news_id' => 'rejobook_news#delete_comment'




=begin
  #thank_buttonのためのルーティング
  resources :thanks, only: []
  get 'members/:id/thanks/:from_member_id/thank_create' => 'thanks#thank_create'
=end

=begin
  devise_for :members, path: 'member', except: [:session] do
    get 'login', to: 'devise/sessions#new', as:  'login'
    post 'login', to: 'devise/sessions#create', as:  'login'
    match 'logout', to: 'devise/sessions#destroy', as:  'logout',
    controllers: {
    # membersのomniauth_callbackというコントローラにルーティングします
      omniauth_callbacks: "members/omniauth_callbacks"
    }
  end
=end
end
