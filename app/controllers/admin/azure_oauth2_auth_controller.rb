class Admin::AzureOauth2AuthController < Admin::BaseController

    skip_before_action :verify_authenticity_token, :only => [:create]
    skip_before_action :login_required
  
    def create
      auth_hash = request.env['omniauth.auth']
      email = auth_hash['info']['email']
      user = User.find_by(email_address: email) rescue nil
      user ||= User.create!(email_address: email, name: auth_hash['info']['name'], password: SecureRandom.hex(15),)
      if !user
        redirect_to root_path, :notice => "Sorry, failed to login with SSO (you are not an admin!)."
      else
        self.current_user = user
        redirect_to admin_root_path
      end
    end
  
    def failure
      redirect_to root_path, :notice => "Sorry, failed to login with SSO."
    end
  
  end
  