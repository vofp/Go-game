#this is the board rb file
#require 'stone'

class Board
	attr_accessor :size, :board
	def initialize(size)
		@size = size
		@board = []
		0.upto(@size-1){|x|
			@board << []
			0.upto(@size-1){|y|
				@board[x][y] = :empty
			}
		}
		
	end
	
	def add_stone(color,x,y)
		if @board[x][y] == :empty then
			@board[x][y] = color
		else
			return false
		end
		c = color == :black ? :white : :black
		a=[]
		if @board[x-1][y]==c && alive?(x-1,y,a) == false then
			empty(a)
		end
		a=[]
		if @board[x][y+1]==c &&  alive?(x,y+1,a) == false then
			empty(a)
		end
		
		a=[]
		if @board[x+1][y]==c && alive?(x+1,y,a) == false then
			empty(a)
		end
	
		a=[]
		if @board[x][y-1]==c && alive?(x,y-1,a) == false then
			empty(a)
		end
		a=[]
		if alive?(x,y,a) == false then
			@board[x][y] = :empty
			return false
		end
		return true
	end
	
	def alive?(x,y,a)
		
		if(x < 0 || x >= size || y < 0 || y >= size ) then
			return false
		end
		
		if a.include?( [x,y] )== false then
			
			if x-1 >=0 && @board[x-1][y] == :empty then
				return true
			end
			if y+1 < size && @board[x][y+1] == :empty then
				return true
			end
			if x+1 < size && @board[x+1][y] == :empty then
				return true
			end
			if y-1 >= 0 && @board[x][y-1] == :empty then
				return true
			end
		
			#Thread
			a << [x,y]
			if x-1 >=0 && @board[x-1][y] == @board[x][y] then
				if alive?(x-1,y,a) then
					return true
				end
			end
			if y+1 < size && @board[x][y+1] == @board[x][y] then
				if alive?(x,y+1,a) then
					return true
				end
			end
			if x+1 < size && @board[x+1][y] == @board[x][y] then
				if alive?(x+1,y,a) then
					return true
				end
			end
			if y-1 >= 0 && @board[x][y-1] == @board[x][y] then
				if alive?(x,y-1,a) then
					return true
				end
			end
			#Thread
			
		end
		
		return false
		
	end
	
	def empty(a)
		a.each{|ar|
			x,y = ar
			@board[x][y] = :empty
		}
	end
	
end

