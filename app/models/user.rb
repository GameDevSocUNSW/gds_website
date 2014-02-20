class User < ActiveRecord::Base

   VALID_NAME_REGEX = /\A[a-z]+\z/i

   # Capitalize names and position before saving to database
   before_save { 
      self.position = position.capitalize!;
      self.first_name = first_name.capitalize!;
      self.last_name = last_name.capitalize!;
   }

   # Validation 
   validates(:first_name, { 
      presence: true, 
      format: { with: VALID_NAME_REGEX }, 
      length: { maximum:50 },
      uniqueness: true
   })
   validates(:last_name, { 
      presence: true, 
      format: { with: VALID_NAME_REGEX },
      length: { maximum:50 },
      uniqueness: { case_sensitive: false }
   })
   validates(:position, { presence: true })

   validates(:password, {
      length: { minimum: 8 }
   })

   has_secure_password
end
