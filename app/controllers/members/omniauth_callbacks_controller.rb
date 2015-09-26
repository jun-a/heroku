class Members::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def google_oauth2
    @member = Member.find_for_google_oauth2(request.env['omniauth.auth'])

    if @member.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
      # sign_in_and_redirect @member, :event => :authentication
      redirect_to my_page_home_path  # Google login に成功でマイページに飛ばす

=begin
      #もし、登録が不十分ならば登録画面へ(この場合は名前)
      if @member.name == nil
        render "members/#{@member.id}/edit"
      else
        redirect_to my_page_home_path
      end
=end
    else
      session['devise.google_data'] = request.env['omniauth.auth']
      redirect_to new_member_registration_url
    end
  end



  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
