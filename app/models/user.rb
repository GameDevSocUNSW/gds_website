class User < ActiveRecord::Base

   VALID_NAME_REGEX = /\A[a-zA-z]+\z/i

   # Capitalize names and position before saving to database
   before_save { 
      self.position.capitalize!;
      self.first_name.capitalize!;
      self.last_name.capitalize!;
   }

   before_create :create_remember_token

   # Validation 
   validates(:first_name, { 
      presence: true, 
      format: { with: VALID_NAME_REGEX }, 
      length: { maximum:50 }
   })
   validates(:last_name, { 
      presence: true, 
      format: { with: VALID_NAME_REGEX },
      length: { maximum:50 }
   })
   validates(:position, {
      presence: true,
      uniqueness: { case_sensitive: false }
   })

   validates(:password, {
      presence: true,
      length: { minimum: 8 }
   })

   has_secure_password

   def User.new_remember_token
      SecureRandom.urlsafe_base64
   end

   def User.encrypt(token)
      Digest::SHA1.hexdigest(token.to_s)
   end

   private 
   def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
   end
end
