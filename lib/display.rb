class Display
	def initialize(b)
		@board = b
	end
	
	def display
		0.upto(b.size){|x|
			0.upto(b.size){|y|
				if b.board[x][y] = :empty then
					print " "
				elsif b.board[x][y] = :black then
					print "X"
				elsif b.board[x][y] = :white then
					print "O"
				end
			}
		}
	end
	
end