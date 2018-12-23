#!/usr/bin/env ruby
################################################################################
# Copyright (C) 2018 Michael Wiseman                                           #
#                                                                              #
# This program is free software: you can redistribute it and/or modify it      #
# under the terms of the GNU Affero General Public License as published by the #
# Free Software Foundation, either version 3 of the License, or (at your       #
# option) any later version.                                                   #
#                                                                              #
# This program is distributed in the hope that it will be useful, but WITHOUT  #
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or        #
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Affero General Public License #
# for more details.                                                            #
#                                                                              #
# You should have received a copy of the GNU Affero General Public License     #
# along with this program.  If not, see <https://www.gnu.org/licenses/>.       #
################################################################################
# Function definitions
def part_one(input)
  map = input.dup
  (1..39).each do |y|
    row = ''
    (0..99).each do |x|
      check_gp = ''

      if x == 0
        check_gp = '.' + map[y-1][x] + map[y-1][x+1]
      elsif x == 99
        check_gp = map[y-1][x-1] + map[y-1][x] + '.'
      else
        check_gp = map[y-1][x-1] + map[y-1][x] + map[y-1][x+1]
      end
      case check_gp
      when '^^.', '.^^', '^..', '..^'
        row += '^'
      else
        row += '.'
      end
    end
    map.push(row)
  end
  safe_spots = 0
  map_str = map.join('')
  map_str.each_char do |c|
    if c == '.'
      safe_spots += 1
    end
  end
  puts safe_spots
end

def part_two(input)
  map = input.dup
  (1..399999).each do |y|
    row = ''
    (0..99).each do |x|
      check_gp = ''

      if x == 0
        check_gp = '.' + map[y-1][x] + map[y-1][x+1]
      elsif x == 99
        check_gp = map[y-1][x-1] + map[y-1][x] + '.'
      else
        check_gp = map[y-1][x-1] + map[y-1][x] + map[y-1][x+1]
      end
      case check_gp
      when '^^.', '.^^', '^..', '..^'
        row += '^'
      else
        row += '.'
      end
    end
    map.push(row)
  end
  safe_spots = 0
  map_str = map.join('')
  map_str.each_char do |c|
    if c == '.'
      safe_spots += 1
    end
  end
  puts safe_spots
end

input_file = File.readlines('day-18-input.txt').map(&:chomp)

# part_one(input_file) # 1926
part_two(input_file) # 19986699
