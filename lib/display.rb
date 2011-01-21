class Display
	def initialize(b)
		@board = b
	end
	
	def display
		(-2).upto(@board.size){|x|
			if(x>=0 && x<@board.size) then
				print(("a"[0]+x).chr)
			else
				print " "
			end
		}
		puts
		0.upto(@board.size-1){|x|
			print(("A"[0]+x).chr)
			print "|"
			0.upto(@board.size-1){|y|
				if @board.board[x][y] == :empty then
					print " "
				elsif @board.board[x][y] == :black then
					print "X"
				elsif @board.board[x][y] == :white then
					print "O"
				end
			}
			print "|"
			puts(("A"[0]+x).chr)
		}
		(-2).upto(@board.size){|x|
			if(x>=0 && x<@board.size) then
				print(("a"[0]+x).chr)
			else
				print " "
			end
		}
		puts
	end
	
	def p
		0.upto(@board.size-1){|x|
			p @board.board[x]
		}
	end
	
end