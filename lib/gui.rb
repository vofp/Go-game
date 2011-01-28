require 'board'
#require 'rubygems'
#require 'ruby-processing'


class Gui  < Processing::App
	#attr_accessor :size, :stones, :b
	def setup
		smooth
    no_stroke
    frame_rate 30
    @stones = 19
		@turn = :black
		@b = Board.new(@stones)
		#@b.add_stone(:black,0,0)
		@size = (width < height ? width : height)/@stones
	end

	def draw
		fill(255,202,122)
		rect(0,0,width, height)
		fill(255)
		z = @size/5
		0.upto(@b.size-1){|x|
			0.upto(@b.size-1){|y|
				if x != 0 then
					rect(y*@size+(@size-z)/2,x*@size,z, (@size-z)/2+z)
				end
				if y != 0 then
					rect(y*@size,x*@size+(@size-z)/2,(@size-z)/2+z,z)
				end
				if x != @stones-1 then
					rect(y*@size+(@size-z)/2,x*@size+(@size-z)/2,z,(@size-z)/2+z)
				end
				if y != @stones-1 then
					rect(y*@size+(@size-z)/2,x*@size+(@size-z)/2,(@size-z)/2+z,z)
				end
				if @b.board[x][y] == :black then
					fill(0)
					ellipse(y*@size+@size/2,x*@size+@size/2, 5*@size/6,5*@size/6)
					fill(255)
				elsif @b.board[x][y] == :white then
					fill(255)
					stroke(0)
					ellipse(y*@size+@size/2,x*@size+@size/2, 5*@size/6,5*@size/6)
					no_stroke
					fill(255)
				end
			}
		}	
		y = mouseX/@size
		x = mouseY/@size

		if @b.board[x][y] == :empty then
			if @turn == :black then
				fill(0,150)
				ellipse(y*@size+@size/2,x*@size+@size/2, 5*@size/6,5*@size/6)
				fill(255)
			elsif @turn == :white then
				fill(255,150)
				ellipse(y*@size+@size/2,x*@size+@size/2, 5*@size/6,5*@size/6)
				fill(255)
			end
		end 
	end
	def mouseClicked
		y = mouseX/@size
		x = mouseY/@size

		if @b.add_stone(@turn,x,y) then
			@turn = (@turn == :black ? :white : :black)
		end
	end

end

Gui.new(:width => 800, :height => 800, :title => "Go")

