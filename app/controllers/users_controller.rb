class UsersController < ApplicationController
  before_action :authenticate_user!






  def create
    if current_user.mldlrole == 1
      @user = User.new(user_params)
      @user.save!
      #UserMailer.new_user_email(@user, @temp_password).deliver_now
      #redirect_to home_admin_path, notice: "#{@user.name} was added"

    end
  end
  def newpassword
    @user= User.find(params[:user_id])
    render 'resetpassword'



  end

  def password_reset


    if current_user.mldlrole == 1
      @user = User.find(params[:user][:id])
      #@user.password = ('0'..'z').to_a.shuffle.first(8).join
     @user.password = params[:user][:password]
    #@temp_password = @user.password
      @user.save!
      #UserMailer.password_reset(@user, @temp_password).deliver_now
      #redirect_to users_path, notice: "#{@user.name} has had password reset and received a temporary password via email"
      redirect_to users_path
    else
      redirect_to root_path, alert: 'Unauthorized Action'
    end

  end
  def update


    @user = User.find(params[:id])
    #user.update_attributes!(user_params)

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


  def index
    @users = User.all
    @user = User.new
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
  def xupdate

    @user= User.find(params[:id])
    if params[:deactivate] == 'yes'
       @user.soft_delete
    end
    if params[:reactivate] == 'yes'
      @user.update_attribute(:deleted_at, nil)
    end

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
    params.require(:user).permit(:name, :email, :password, :mldlrole, :confirmed_at, :deleted_at,  role_ids: [])
  end


end