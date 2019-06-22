class Tile
  attr_reader :letter, :position

  def initialize(letter, position)
    @letter = letter
    @position = position
  end

  def matches(letter)
    @letter == letter || is_wildcard?
  end

  def print_to_console
    print "#{letter} #{"\n" if position % 4 == 3}"
  end

  def get_adjacent_positions
    row = (position / 4)  # Ruby will round-down integer division
    col = position % 4

    adjacent_positions = []
    adjacent_positions.push(position - 4) if row > 0  # top
    adjacent_positions.push(position + 4) if row < 3  # bottom
    adjacent_positions.push(position - 1) if col > 0  # left
    adjacent_positions.push(position + 1) if col < 3  # right
    adjacent_positions.push(position - 5) if row > 0 && col > 0  # top-left
    adjacent_positions.push(position - 3) if row > 0 && col < 3 # top-right
    adjacent_positions.push(position + 3) if row < 3 && col > 0  # bottom-left
    adjacent_positions.push(position + 5) if row < 3 && col < 3  # bottom-right

    adjacent_positions
  end

  private

  def is_wildcard?
    @letter == '*'
  end
end
