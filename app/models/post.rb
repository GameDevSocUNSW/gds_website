class Post < ActiveRecord::Base
   belongs_to :user

   # Order posts by descending order.
   default_scope -> { order('created_at DESC') }

   # Validations
   validates(:user_id, presence: true)
   validates(:content, presence: true)
   validates(:title, presence: true)
end
