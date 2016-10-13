class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_action :set_locale
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  before_action :authenticate_user!
  protect_from_forgery with: :exception

  #allstructs = Structure.pluck(:id)
  #delophans = Issue.where('structure_id not in (?)', allstructs).delete_all





end
