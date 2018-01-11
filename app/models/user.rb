class User < ApplicationRecord

	before_save {self.email.downcase!}



	validates :email, presence: :true 
	validates :name, presence: :true 


end
