require 'board'
require 'display'

class Management
	def initialize
		b = Board.new(9)
		puts b.add_stone(:black,0,0)
		d = Display.new(b)
		d.print
		puts b.add_stone(:white,1,0)
		d.print
		puts b.add_stone(:white,0,1)
		d.print
		puts b.add_stone(:black,0,2)
		d.print
		puts b.add_stone(:black,2,0)
		d.print
		puts b.add_stone(:black,1,1)
		d.print
		puts b.add_stone(:black,0,0)
		d.print
	end
end

m = Management.new