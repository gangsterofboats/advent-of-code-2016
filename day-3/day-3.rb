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
  possibles = 0
  input.each do |line|
    tria = line.split.map(&:to_i).sort
    if tria[0] + tria[1] > tria[2]
      possibles += 1
    end
  end
  puts possibles
end

def part_two(input)
  possibles = 0
  f_col = []
  s_col = []
  t_col = []

  input.each do |line|
    ln = line.split.map(&:to_i)
    f_col.push(ln[0])
    s_col.push(ln[1])
    t_col.push(ln[2])
  end
  f_col.each_slice(3) do |slc|
    slc.sort!
    if slc[0] + slc[1] > slc[2]
      possibles += 1
    end
  end
  s_col.each_slice(3) do |slc|
    slc.sort!
    if slc[0] + slc[1] > slc[2]
      possibles += 1
    end
  end
  t_col.each_slice(3) do |slc|
    slc.sort!
    if slc[0] + slc[1] > slc[2]
      possibles += 1
    end
  end
  puts possibles
end

input_file = File.readlines('day-3-input.txt').map(&:chomp)

# part_one(input_file) # 1032
part_two(input_file) # 1838
