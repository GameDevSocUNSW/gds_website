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
   def index
      @posts = Post.all
   end

   private
   def post_params
      params.require(:post).permit(:title, :content, :content_type)
   end
end
