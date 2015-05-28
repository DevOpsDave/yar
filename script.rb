#!/usr/bin/env ruby


def find_needle(needle, haystack)

            # Create arrays of the two strings.
	needle_arr = needle.split('') 
	haystack_arr = haystack.split('')

	# This will track the status of success.
	found = false

	for hs_ind in 0..haystack_arr.size
		# Just to be on the safe side I will make a copy of hs_ind. I will potentially modify the value of temp_hs_ind if I have successfull matches
		# but for longer sizes of needle_arr, if the inner loop fails I want to return to my original value of hs_ind.
		temp_hs_ind = hs_ind
		for ndl_ind in 0..needle_arr.size
			if haystack_arr[temp_hs_ind]  != needle_arr[ndl_ind]
				# The chain of matches fails.  Set found to false and break out of inner loop.
				found = false
				break
			else
				# Success! We need to check the next element of needle_arr against the next element of haystack_arr.
				found = true
				temp_hs_ind +=1
			end
		end
		# If found still equalls true after going around the inner loop then there is no need to  do any more work.
		if found == true
			return found
		end

	end
	return found
end


puts %(find 'd' in 'david'.  Returns true.)
puts find_needle('d', 'david'), "\n"

puts %(find 'z' in 'david'.  Returns false.)
puts find_needle('z', 'david'), "\n"

puts %(find 'id' in 'david'.  Returns true.)
puts find_needle('id', 'david'), "\n"

puts %(find 'zd' in 'david'.  Returns false.)
puts find_needle('zd', 'david'), "\n"

puts %(find 'lld' in 'ball'.  Returns false.)
puts find_needle('lld', 'ball'), "\n"






