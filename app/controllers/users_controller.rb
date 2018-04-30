class UsersController < ApplicationController
    
    before_action :set_user, only:[:show, :edit, :update, :destroy]
    before_action :require_same_user, only:[:destroy, :update, :edit]
    
    def index
       @user = User.all 
    end
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "welcome #{@user.username}"
            redirect_to articles_path
        else
            render 'new'
        end
        
    end
    
    def show

    end
     
    def edit

    end
    
    def destroy
        if @user.destroy
            flash[:danger] = "User has successfully deleted"
            redirect_to users_path
        end
    end
    
    def update
        if @user.update(user_params)
            flash[:success] = "yr account has updated successfully"
            redirect_to articles_path
        else
            render 'edit'
        end
    end
    
    private
    
    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
    
    def set_user
         @user = User.find(params[:id])
    end

    def require_same_user
        if !logged_in? || (current_user != @user && !current_user.admin?)
            flash[:danger] = "you can only edit your profile"
            redirect_to root_path
        end
    end
end
