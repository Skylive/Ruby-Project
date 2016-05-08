class Member < ActiveRecord::Base
    before_save { self.login = login.downcase }
    validates :login, presence: true, length: { minimum: 1 }
    has_secure_password
    validates :password, presence: true, length: { minimum: 1 }
    
    # Returns the hash digest of the given string.
    #  def Member.digest(string)
    #    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
    #                                                  BCrypt::Engine.cost
    #  BCrypt::Password.create(string, cost: cost)
    # end
    def full_name
        "#{self.firstname} #{self.lastname}"
    end
end
