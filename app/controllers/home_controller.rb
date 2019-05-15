class HomeController < Admin::ApplicationController
  def index
    @user_kind = ''
    if current_user.has_role? :admin
      @user_kind = 'Admin'
    elsif current_user.has_role? :franchisee
      @user_kind = 'Franqueado'
    elsif current_user.has_role? :property
      @user_kind = 'Proprietário'
    end
  end
end
