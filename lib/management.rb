require 'board'
require 'display'

class Management
	def initialize
		b = Board.new(19)
		d = Display.new(b)
		while true
			d.display
			puts "Black player's move(Aa): "
			input = gets.chomp
			x = input[0]-"A"[0]
			y = input[1]-"a"[0]
			while(b.add_stone(:black,x,y)==false)do
				d.display
				puts "Invalid input"
				puts "Black player's move(Aa): "
				input = gets.chomp
				x = input[0]-"A"[0]
				y = input[1]-"a"[0]
			end
			d.display
			puts "White player's move(Aa): "
			input = gets.chomp
			x = input[0]-"A"[0]
			y = input[1]-"a"[0]
			while(b.add_stone(:white,x,y)==false)do
				d.display
				puts "Invalid input"
				puts "White player's move(Aa): "
				input = gets.chomp
				x = input[0]-"A"[0]
				y = input[1]-"a"[0]
			end
		end
	end
	
end

m = Management.new