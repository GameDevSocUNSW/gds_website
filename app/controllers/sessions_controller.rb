class SessionsController < ApplicationController
   include SessionsHelper
   def new
   end
   def create
      @error=''
      user = User.find_by(position: params[:session][:position])
      if (user && user.authenticate(params[:session][:password]))
         sign_in user
         redirect_to root_path
      else
         if (!user)
            @error = "You don't belong here, do you?"
         elsif (!user.authenticate(params[:session][:password]))
            @error = "Tsk tsk."
         end
         render 'new'
      end

   end
   def destroy
      sign_out
      redirect_to root_path
   end
end
