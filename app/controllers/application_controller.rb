class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :set_locale
  before_filter :subdomain_view_path
private
  
  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
      # current_user.locale
      # request.subdomain
      # request.env["HTTP_ACCEPT_LANGUAGE"]
      # request.remote_ip
  end

  def default_url_options(options = {})
    {locale: I18n.locale}
  end

  def subdomain_view_path
    prepend_view_path "app/views/#{request.subdomain}_subdomain" if request.subdomain.present?
  end
end
