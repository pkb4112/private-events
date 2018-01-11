class User < ApplicationRecord

	has_many :hosted_events, class_name: "Event", foreign_key: "host_id"
	has_many :guest_lists
	has_many :attended_events, through: :guest_lists, source: :event
	before_save {self.email.downcase!}


	validates :email, presence: :true 
	validates :name, presence: :true 

   


end
