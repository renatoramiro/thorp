class UsersController < ApplicationController
	layout 'dashboard'
	before_filter :authenticate_user!
  
  def index
  	if params[:search].present?
  		@users = User.search(params[:search]).where("id != ?", current_user.id).where("confirmed_at is not null").order(:username).paginate(page: params[:page], per_page: 40)
  	else
  		@users = []
  	end
  end

  def show
  	begin
  		@user = User.where(:username => params[:id])
      @user = @user[0]
	  rescue ActiveRecord::RecordNotFound => e
	  	redirect_to posts_url, alert: "Usuario com id #{params[:id]} nao foi encontrado."
	  end
  end
end
