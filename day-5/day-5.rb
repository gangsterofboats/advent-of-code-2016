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
require 'digest'

# Function definitions
def part_one(input)
  password = ''
  i = 0

  while password.length < 8
    hashed_id = Digest::MD5.hexdigest "#{input}#{i}"
    if hashed_id[0..4] == '00000'
      password += hashed_id[5]
    end
    i += 1
  end

  puts password
end

def part_two(input)
  password = '........'
  stop = false
  i = 0

  while stop == false
    hashed_id = Digest::MD5.hexdigest "#{input}#{i}"
    if hashed_id[0..4] == '00000' and hashed_id[5] =~ /\d/ and hashed_id[5].to_i < 8
      position = hashed_id[5].to_i
      password[position] = hashed_id[6] unless password[position] != '.'
    end
    i += 1
    if not password.include? '.'
      stop = true
    end
  end

  puts password
end

input_str = 'uqwqemis'

# part_one(input_str) # 1a3099aa
part_two(input_str) # 694190cd
