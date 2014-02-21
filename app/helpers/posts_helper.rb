module PostsHelper

   def get_author_name(post)
      user = User.find_by(post.user_id)
      return "#{user.first_name} #{user.last_name} [#{user.position}]"
   end
end
