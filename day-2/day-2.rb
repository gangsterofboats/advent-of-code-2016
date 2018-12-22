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
  input.each do |line|
    num = 5
    curr_pos = [1, 1]
    numpad = [[1,2,3],[4,5,6],[7,8,9]]
    line.each_char do |c|
      case c
      when 'U'
        unless curr_pos[1] == 0
          curr_pos[1] -= 1
        end
      when 'D'
        unless curr_pos[1] == 2
          curr_pos[1] += 1
        end
      when 'L'
        unless curr_pos[0] == 0
          curr_pos[0] -= 1
        end
      when 'R'
        unless curr_pos[0] == 2
          curr_pos[0] += 1
        end
      end
    end
    num = numpad[curr_pos[1]][curr_pos[0]]
    puts num
  end
end

def part_two(input)
  input.each do |line|
    code = ''
    curr_pos = [0, 2]
    numpad = [[nil, nil, 1, nil, nil], [nil, 2, 3, 4, nil], [5,6,7,8,9], [nil, 'A','B','C', nil], [nil, nil, 'D', nil, nil]]
    line.each_char do |c|
      case c
      when 'U'
        unless curr_pos == [0, 2] or curr_pos == [1, 1] or curr_pos == [2, 0] or curr_pos == [3,1] or curr_pos == [4, 2]
          curr_pos[1] -= 1
        end
      when 'D'
        unless curr_pos == [0, 2] or curr_pos == [1,3] or curr_pos == [2, 4] or curr_pos == [3, 3] or curr_pos == [4, 2]
          curr_pos[1] += 1
        end
      when 'L'
        unless curr_pos == [2, 0] or curr_pos == [1, 1] or curr_pos == [0, 2] or curr_pos == [1, 3] or curr_pos == [2,4]
          curr_pos[0] -= 1
        end
      when 'R'
        unless curr_pos == [2, 0] or curr_pos == [3, 1] or curr_pos == [4, 2] or curr_pos == [3, 3] or curr_pos == [2,4]
          curr_pos[0] += 1
        end
      end
    end
    puts numpad[curr_pos[1]][curr_pos[0]]
  end
end

input_file = File.readlines('day-2-input.txt').map(&:chomp)

# part_one(input_file) # 33444
part_two(input_file) # 446A6
