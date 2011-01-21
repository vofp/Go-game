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
		a=[]
		if alive?(x-1,y,a) == false then
			empty(a)
		end
		
		if alive?(x,y+1,a) == false then
			empty(a)
		end
		
		if alive?(x+1,y,a) == false then
			empty(a)
		end
		
		if alive?(x,y-1,a) == false then
			empty(a)
		end
		
		if(!alive?(x,y)){
			board[x][y] = :empty
			return true
		}
		
	end
	def alive?(x,y,a)
		if( a.include?([x,y] == false ) then
			
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
				if alive?(x-1,y,a) then
					return true
				end
			end
			if board[x][y+1].status == board[x][y].status then
				if alive?(x,y+1,a) then
					return true
				end
			end
			if board[x+1][y].status == board[x][y].status then
				if alive?(x+1,y,a) then
					return true
				end
			end
			if board[x][y-1].status == board[x][y].status then
				if alive?(x,y-1,a) then
					return true
				end
			end
			#Thread
			a << [x,y]
		end
		
		return false
		
	end
	def empty(a)
		a.each{|ar|
			x,y = ar
			board[x][y] = :empty
		}
	end
	
end
