class UsersController < ApplicationController
  	
    skip_before_action :require_valid_user!

    def index
      @users = User.all
      @enum = User.roles
      authorize @user
    end

  	def new
  		@user = User.new
  	end

  	def create
  		@user = User.new(user_params)

  		if@user.save
  			flash[:success] = 'new user is created'
  			redirect_to login_path
  		else
  			render :new
  		end
  	end

    def update
      @user = User.find(params[:id])
      # @category = Category.all
      # authorize @user
      if @user.update(user_params)
        redirect_to :action => 'index'
      else
        render 'edit'
      end
    end

  	def user_params
  		params.require(:user).permit(:email, :password, :password_confirmation, :role)  		
  	end

end
