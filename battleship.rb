class Ship
  attr_reader :row, :column, :direction, :length

  def initialize(row, column, direction, length)
    @row = row
    @column = column
    @direction = direction
    @length = length
  end
end

class Board
  def initialize()
    @ships = []
    @attacks = []
  end

  def create_ship(row, column, direction, length)
    # TODO check that the ship and position is valid
    @ships.push(Ship.new(row, column, direction, length))
  end

  def attack(row, column)
    @attacks.push([row, column])
  end

  def own
    b = Array.new(10) { [] }

    @ships.each do |ship|
      if ship.direction == :horizontal
        ship.length.times do |i|
          b[ship.row][ship.column + i] = ship.length
        end
      else
        ship.length.times do |i|
          b[ship.row + i][ship.column] = ship.length
        end
      end
    end

    @attacks.each do |attack|
      b[attack[0]][attack[1]] = "*"
    end

    b
  end

  def print_own
    b = own
    puts "   0  1  2  3  4  5  6  7  8  9 "
    10.times do |row|
      print "#{row} "
      10.times do |column|
        print b[row][column].nil? ? " - " : " #{b[row][column]} "
      end
      puts ""
    end
  end

  def print_enemy
    
  end
end

board1 = Board.new
board1.create_ship(0, 0, :horizontal, 5)
board1.create_ship(1, 1, :vertical, 4)

board1.attack(1, 1)
board1.attack(6, 6)

board1.print_own















