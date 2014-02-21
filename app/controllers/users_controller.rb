class UsersController < ApplicationController
   include SessionsHelper

   def new
   end

   def edit
      if (!signed_in?)
         redirect_to root_path
      else
         @user = current_user
      end
   end

   def update
      @user = current_user
      if (@user.update_attributes(user_params))
         @success = true;
         render 'edit'
      else
         render 'edit'
      end
   end

   private
   def user_params
      params.require(:user).permit(:first_name, :last_name, :position, 
                                   :password, :password_confirmation)
   end
end
