class Event < ApplicationRecord
	belongs_to :host, class_name: "User"
	has_many :guest_lists
	has_many :guests, through: :guest_lists, source: :user 

	scope :past, -> {where("date < ?", Time.now)}
	scope :future, -> {where("date > ?", Time.now)}

    



end
