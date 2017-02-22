class Note < ActiveRecord::Base
	belongs_to :user
	has_many :viewers
	has_many :readers, through: :viewers, source: :user
	 before_save :can_read_his_notes

    def visible_to=(data)
    	self.readers =data.split(",").map{|user| User.find_by(name:user.strip)}.compact
    end
    def visible_to
    	self.readers.map{|user| user.name}.join(", ")
    end
    def can_read_his_notes
       if self.user && !self.readers.include?(user)
            self.readers << self.user
        end 
    end
end
