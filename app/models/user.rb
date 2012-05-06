
class User < ActiveRecord::Base
	
    has_many :todotasks, :dependent => :destroy
               
	attr_accessible :name,:email

	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :name  , :presence => false , :length => {:maximum => 15}
	validates :email , :presence => true , 
					   :format => {:with => email_regex},
					   :uniqueness => {:case_sensitive => false}
 

    def self.authenticate(email)
    	find_by_email(email)
    end


end

