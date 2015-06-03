require 'active_record'


class Todo < ActiveRecord::Base
	establish_connection adapter: 'sqlite3',
						 database: 'todomvc.db'

# you'll need a little more than this

def self.item_complete?
	Todo.where(complete: true).any?
end


end
