require_relative 'display'

class Player
  attr_reader :display

  def initialize(display, color)
    @display = display
    @color = color
  end

  def play_turn
    puts "Please select a piece to move:"
    from_pos = @display.move_cursor
    puts "Please select end position:"
    to_pos = @display.move_cursor
    [from_pos, to_pos]
  end

end
