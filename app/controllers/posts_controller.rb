class PostsController < ApplicationController
   include SessionsHelper
   include PostsHelper

   def new
      @post = Post.new
      if (!signed_in?)
         redirect_to root_path
      end
   end

   def create
      @post = Post.new(post_params)
      @post.user_id = current_user.id
      if @post.save 
         redirect_to root_path
      else 
         render 'new'
      end
   end

   def edit 
      if (!signed_in?)
         redirect_to root_path
      end
      @post = Post.find(params[:id])
   end

   def update
      @post = Post.find(params[:id])
      if (@post.update_attributes(post_params))
         redirect_to root_path
      else
         render 'edit'
      end
   end

   def index
      @posts == Post.all
   end

   def destroy
      if (!signed_in?)
         redirect_to root_path
      else
         Post.find(params[:id]).destroy
         redirect_to root_path
      end
   end

   private
   def post_params
      params.require(:post).permit(:title, :content, :content_type)
   end
end
