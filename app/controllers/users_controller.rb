class UsersController < ApplicationController
    # before_action :authenticate_user!

    def create
      @user = User.new(user_params)
      @user.skip_password_validation = true
      if @user.save
        flash[:notice] = "Thanks for signing up, we will be in touch soon."
        redirect_to(root_path)
      else
        flash[:alert] = "Something went wrong!."
        redirect_to(root_path)
      end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to edit_user_path, notice: "User profile updated successfully"
        else
            redirect_to edit_user_path, notice: @user.errors.full_messages.join
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :username,:phone_number,:identifier,:company_name,:linkedin_link,:githhub_link,:website_link,:portfolio,:other_link1,:other_link2,:other_link3,:experience, :email, :phone_number, :location, :user_type)
    end
end
