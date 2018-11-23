class Admin::GraphAuthController < Admin::BaseController

    skip_before_action :verify_authenticity_token, :only => [:create]
    skip_before_action :login_required
  
    def create
      auth_hash = request.env['omniauth.auth']
      email = auth_hash['info']['email']
      user = User.find_by(email_address: email)
      self.current_user = user
      redirect_to admin_root_path
    end
  
    def failure
      redirect_to root_path, :notice => "Sorry, failed to login with SSO."
    end
  
  end
  