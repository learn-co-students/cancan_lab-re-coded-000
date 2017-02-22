class Note < ActiveRecord::Base
	belongs_to :user
	has_many :viewers
	has_many :readers, through: :viewers, source: :user
	 before_save :ensure_owner_can_read

    def visible_to=(data)
    	self.readers =data.split(",").map{|user| User.find_by(name:user.strip)}.compact
    end
    def visible_to
    	self.readers.map{|user| user.name}.join(", ")
    end
    def ensure_owner_can_read
       if self.user && !self.readers.include?(user)
            self.readers << self.user
        end 
    end
end
