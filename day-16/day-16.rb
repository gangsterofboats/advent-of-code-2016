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
def dragon_curve(data)
  b = data.dup
  b.reverse!
  b.split('').each_with_index do |c,i|
    if c == '0'
      b[i] = '1'
    elsif c == '1'
      b[i] = '0'
    end
  end
  return data + '0' + b
end

def part_one(input)
  state = input.dup

  while state.length < 272
    state = dragon_curve(state)
  end

  prcm = state[0..271]
  while prcm.length % 2 == 0
    mcrp = ''
    prcm.split('').each_slice(2) do |pr|
      if pr[0] == pr[1]
        mcrp += '1'
      else
        mcrp += '0'
      end
    end
    prcm = mcrp.dup
  end
  puts prcm
end

def part_two(input)
  state = input.dup

  while state.length < 35651584
    state = dragon_curve(state)
  end

  prcm = state[0..35651583]
  while prcm.length % 2 == 0
    mcrp = ''
    prcm.split('').each_slice(2) do |pr|
      if pr[0] == pr[1]
        mcrp += '1'
      else
        mcrp += '0'
      end
    end
    prcm = mcrp.dup
  end
  puts prcm
end

input_str = '01000100010010111'

# part_one(input_str) # 10010010110011010
part_two(input_str) # 01010100101011100
