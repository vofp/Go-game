class Display
	def initialize(b)
		@board = b
	end
	
	def display
		0.upto(@board.size-1){|x|
			0.upto(@board.size-1){|y|
				if @board.board[x][y] == :empty then
					print " "
				elsif @board.board[x][y] == :black then
					print "X"
				elsif @board.board[x][y] == :white then
					print "O"
				end
			}
			puts
		}
	end
	
	def print
		0.upto(@board.size-1){|x|
			p @board.board[x]
		}
	end
	
end