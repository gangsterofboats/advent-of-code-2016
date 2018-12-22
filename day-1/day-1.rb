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
require 'set'

# Function definitions
def part_one(input)
  directions = input[0].split(', ')
  curr_dir = 0
  start = [0, 0]
  curr_pos = [0, 0]
  directions.each do |d|
    turn, steps = d[0], d[1..-1]
    steps = steps.to_i
    case turn
    when 'L'
      curr_dir = (curr_dir - 1) % 4
    when 'R'
      curr_dir = (curr_dir + 1) % 4
    end
    case curr_dir
    when 0
      curr_pos[1] += steps
    when 1
      curr_pos[0] += steps
    when 2
      curr_pos[1] -= steps
    when 3
      curr_pos[0] -= steps
    end
  end
  puts (curr_pos[1] - start[1]).abs + (curr_pos[0] - start[0]).abs
end

def part_two(input)
  directions = input[0].split(', ')
  curr_dir = 0
  start = [0, 0]
  curr_pos = [0, 0]
  step = 1
  pts_visited = Set.new([[0,0]])
  directions.each do |d|
    turn, steps = d[0], d[1..-1]
    steps = steps.to_i
    step = 1
    case turn
    when 'L'
      curr_dir = (curr_dir - 1) % 4
    when 'R'
      curr_dir = (curr_dir + 1) % 4
    end

    if curr_dir == 2 or curr_dir == 3
      step = step * -1
    end

    1.upto(steps)
      case curr_dir
      when 0, 2
        curr_pos[1] += step
      when 1, 3
        curr_pos[0] += step
      end
      if not pts_visited.include? curr_pos
        pts_visited.add(curr_pos.dup)
      else
        break
      end
    end
  end
  puts (curr_pos[1] - start[1]).abs + (curr_pos[0] - start[0]).abs
end

input_file = File.readlines('day-1-input.txt').map(&:chomp)

# part_one(input_file) # 332
part_two(input_file) # 166
