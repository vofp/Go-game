#this is the board rb file

class Board
	def initialize(size)
    @board = Array::new(size,Array::new(size,Stone(:empty)))
	end
	def add_stone(color,x,y)
		if board[x][y] == :empty then
			board[x][y].status = color
		else
			return false
		end
		
		alive?(x-1,y)
		alive?(x,y+1)
		alive?(x+1,y)
		alive?(x,y-1)
		
	end
	def alive?(x,y)
		check_a = []
		if board[x-1][y].status == :empty then
			return true
		end
		if board[x][y+1].status == :empty then
			return true
		end
		if board[x+1][y].status == :empty then
			return true
		end
		if board[x][y-1].status == :empty then
			return true
		end
		
		#Thread
		if board[x-1][y].status == board[x][y].status then
			if alive?(x-1,y) then
				return true
			end
		end
		if board[x][y+1].status == board[x][y].status then
			if alive?(x,y+1) then
				return true
			end
		end
		if board[x+1][y].status == board[x][y].status then
			if alive?(x+1,y) then
				return true
			end
		end
		if board[x][y-1].status == board[x][y].status then
			if alive?(x,y-1) then
				return true
			end
		end
		#Thread
		
		
		return false
		
	end
end
