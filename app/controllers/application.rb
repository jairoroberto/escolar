# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  include AuthenticatedSystem
  before_filter :login_required, :current_escola

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'af489420433c7cc73d4e3cc5c0fb2cd3'

  def current_empresa_id
    current_escola_id
  end

  def current_escola_id
  	session[:escola_id]
  end

  def current_escola
  	@current_escola ||= Escola.find current_escola_id
  end
end
