require 'board'
require 'display'
require 'gui'

class Management
	def initialize
		gui
	end
	
	def cl
		b = Board.new(19)
		d = Display.new(b)
		while true
			
			[:black,:white].each{|c|
				d.display
				puts (c == :black ? "Black" : "White") +  " player's move(Aa): "
				input = gets.chomp
				x = input[0]-"A"[0]
				y = input[1]-"a"[0]
				while(b.add_stone(c,x,y)==false)do
					d.display
					puts "Invalid input"
					puts (c == :black ? "Black" : "White")+" player's move(Aa): "
					input = gets.chomp
					x = input[0]-"A"[0]
					y = input[1]-"a"[0]
				end

			}
		end
	end

	def gui
		Gui.new(:width => 900, :height => 900, :title => "Go")
	end

end
m = Management.new
