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
class String
  AB = ('a'..'z').to_a

  def caesar_cipher(num)
    self.tr(AB.join, AB.rotate(num).join)
  end
end

def part_one(input)
  sector_sum = 0
  input.each do |ln|
    f, cksm = ln.split('[')
    cksm = cksm[0..cksm.length - 2]
    sector_id = f[-3..-1].to_i
    e_name = f[0..f.length-4]
    e_name.gsub!('-', '')
    letters = Hash.new(0)
    e_name.each_char do |c|
      letters[c] += 1
    end
    letters = letters.sort_by {|k,v| [-v, k]}.to_h
    ltrs = letters.take(5).to_h.keys.join
    if ltrs == cksm
      sector_sum += sector_id
    end
  end
  puts sector_sum
end

def part_two(input)
  sector_sum = 0
  input.each do |ln|
    f, cksm = ln.split('[')
    cksm = cksm[0..cksm.length - 2]
    sector_id = f[-3..-1].to_i
    e_name = f[0..f.length-4]
    e_name.gsub!('-', ' ')
    d_name = e_name.caesar_cipher(sector_id % 26)
    puts sector_id if d_name.include? 'north'
  end
end

input_file = File.readlines('day-4-input.txt').map(&:chomp)

# part_one(input_file) # 409147
part_two(input_file) # 991
