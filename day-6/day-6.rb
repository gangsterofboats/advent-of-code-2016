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
  ltr_pos_freq = [Hash.new(0), Hash.new(0), Hash.new(0), Hash.new(0), Hash.new(0), Hash.new(0), Hash.new(0), Hash.new(0)]
  message = ''
  input.each do |line|
    ln = line.split('')
    ln.each_with_index do |v,i|
      ltr_pos_freq[i][v] += 1
    end
  end

  ltr_pos_freq.each do |pos|
    mx = pos.max_by{|key,value| value}
    message += mx[0]
  end
  puts message
end

def part_two(input)
  ltr_pos_freq = [Hash.new(0), Hash.new(0), Hash.new(0), Hash.new(0), Hash.new(0), Hash.new(0), Hash.new(0), Hash.new(0)]
  message = ''
  input.each do |line|
    ln = line.split('')
    ln.each_with_index do |v,i|
      ltr_pos_freq[i][v] += 1
    end
  end

  ltr_pos_freq.each do |pos|
    mx = pos.min_by{|key,value| value}
    message += mx[0]
  end
  puts message
end

input_file = File.readlines('day-6-input.txt').map(&:chomp)

# part_one(input_file) # xhnqpqql
part_two(input_file) # brhailro
