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
  blocked_ips = []
  input.each do |line|
    line.sub!('-', '..')
    larr = eval "(#{line}).to_a"
    blocked_ips += larr
    blocked_ips.uniq!
    blocked_ips.sort!
  end
  i = 0
  while blocked_ips[i] == i
    i += 1
  end
  puts i
end

def part_two(input)
  blocked_ips = []
  allowed_ips = []
  input.each do |line|
    line.sub!('-', '..')
    larr = eval "(#{line}).to_a"
    blocked_ips += larr
    blocked_ips.uniq!
    blocked_ips.sort!
  end
  i = 0
  0.upto(4294967295) do |i|
    if not blocked_ips.include? i
      allowed_ips.push(i)
    end
  end
  puts allowed_ips.length
end

input_file = File.readlines('day-20-input.txt').map(&:chomp)

part_one(input_file) # 32259706
part_two(input_file) # 113
