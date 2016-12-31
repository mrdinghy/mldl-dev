class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
   @userroles = Userrole.where('user_id = ?', @user.id)
   @allroles = Role.all
    @alluserroles = Userrole.all
    @mystructures = Manager.where('user_id = ?', @user.id)
    @myactions = Issueaction.where('user_id = ?', @user.id).order('created_at DESC')
    #unless @user == current_user
      #redirect_to :back, :alert => "Access denied."
    #end
  end

  def adjustroles

    @user = User.find(params[:user_id])
    @role_list = Role.all

    #@userroles = Userrole.where('user_id = ?', @user.id)

    render 'editroles'
    #unless @user == current_user
    #redirect_to :back, :alert => "Access denied."
    #end
  end


  def newmldluser

    render 'addmldluser'
  end
  def createuser
    @user = User.new
    @user.update_attributes(name: params[:name],email: params[:email],password: params[:password],mldlrole: params[:mldlrole])
    render 'users/index'
  end

  # PATCH/PUT /resources/1
  # PATCH/PUT /resources/1.json
  def update
    @user= User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = user.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :mldlrole, :confirmed_at, role_ids: [])
  end


end