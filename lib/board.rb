#this is the board rb file

class Board
	def initialize(size)
    @board = Array::new(size,Array::new(size,Stone(:empty)))
  end
end
