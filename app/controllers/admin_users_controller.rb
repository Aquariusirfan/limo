class AdminUsersController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:search]
      @users = User.where('(first_name LIKE ? OR email LIKE ?) AND (invited_by_id = ? AND invitation_accepted_at IS NOT ?)', "%#{params[:search]}%", "%#{params[:search]}%", current_user.id, nil )
    else
      #      @users = User.where.not(invitation_accepted_at: nil).where(invited_by_id: current_user.id)
      #      @users = current_user.company.users.where(:invitation_token=>nil)
      @users = User.where('(first_name LIKE ? OR email LIKE ?) AND (invited_by_id = ? AND invitation_accepted_at IS NOT ?)', "%#{params[:search]}%", "%#{params[:search]}%", current_user.id, nil )
    end
  end

end

