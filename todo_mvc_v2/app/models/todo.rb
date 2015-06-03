class Todo < ActiveRecord::Base
	attr_accessor :being_edited

def self.toggle_all
    # to start, just set them all to be true
    # that is, update them all to be complete: true
    # time to look up another method...
    # Todo.update_all complete: true
    # now let's have a more sophisticated version
	if Todo.where(complete: false).any?
	      self.update_all complete: true
	else
	      self.update_all complete: false
	end
end 


def self.clear_completed #class method
    self.where(complete: true).destroy_all
end


end
