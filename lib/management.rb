require 'board'
require 'display'

class Management
	def initialize
		b = Board.new(9)
		b.add_stone(:black,0,0)
		d = display.new(b)
	end
end
