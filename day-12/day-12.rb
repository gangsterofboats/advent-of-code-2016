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
  registers = {'a' => 0, 'b' => 0, 'c' => 0, 'd' => 0}
  inst_pt = 0

  while inst_pt < input.length
    action, s = input[inst_pt].split(' ', 2)
    case action
    when 'cpy'
      val, reg = s.split
      if val =~ /\d+/
        val = val.to_i
        registers[reg] = val
      else
        registers[reg] = registers[val]
      end
      inst_pt += 1
    when 'inc'
      registers[s] += 1
      inst_pt += 1
    when 'dec'
      registers[s] -= 1
      inst_pt += 1
    when 'jnz'
      reg, jmp = s.split
      jmp = jmp.to_i
      if (reg =~ /\d+/ and reg.to_i > 0) or (registers[reg] > 0)
        if (inst_pt + jmp < input.length)
          inst_pt += jmp
        else
          break
        end
      else
        inst_pt += 1
      end
    end
  end
  puts registers['a']
end

def part_two(input)
  registers = {'a' => 0, 'b' => 0, 'c' => 1, 'd' => 0}
  inst_pt = 0

  while inst_pt < input.length
    action, s = input[inst_pt].split(' ', 2)
    case action
    when 'cpy'
      val, reg = s.split
      if val =~ /\d+/
        val = val.to_i
        registers[reg] = val
      else
        registers[reg] = registers[val]
      end
      inst_pt += 1
    when 'inc'
      registers[s] += 1
      inst_pt += 1
    when 'dec'
      registers[s] -= 1
      inst_pt += 1
    when 'jnz'
      reg, jmp = s.split
      jmp = jmp.to_i
      if (reg =~ /\d+/ and reg.to_i > 0) or (registers[reg] > 0)
        if (inst_pt + jmp < input.length)
          inst_pt += jmp
        else
          break
        end
      else
        inst_pt += 1
      end
    end
  end
  puts registers['a']
end

input_file = File.readlines('day-12-input.txt').map(&:chomp)

# part_one(input_file) # 318083
part_two(input_file) # 9227737
