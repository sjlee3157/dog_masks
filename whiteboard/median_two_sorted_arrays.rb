# Time: O(n)
# Space: O(1)

def find_median_sorted_arrays(nums1, nums2)
    # first, check if both Arrays begins with nil
    return nil if nums1[0] == nil && nums2[0] == nil

    tot_length = (nums1.length + nums2.length)

    # if odd, stop at middle. if even, stop AFTER middle.
    stop_at_elm = (tot_length / 2) + 1

    i = -1           # CURR index pointer in Array nums1
    j = -1           # CURR index pointer in Array nums2
    prev = nil       # value at PREV incremented index
    curr = nil       # value at CURR incremented index

    stop_at_elm.times do
        # if we can't increment i, then increment j
        if i == nums1.length - 1
            j += 1
            prev = curr
            curr = nums2[j]

        # if we can't increment j, then increment i
        elsif j == nums2.length - 1 
            i += 1
            prev = curr
            curr = nums1[i]

        # otherwise, increment to the smaller next value
        else
            if nums1[i+1] <= nums2[j+1] # increment i
                i += 1
                prev = curr
                curr = nums1[i] 
            else # increment j
                j += 1
                prev = curr
                curr = nums2[j]
            end

        end
    end

    # if total length is odd
    if (tot_length % 2 == 1)
        median = curr
        
    # if total length is even
    else
        # make sure to print decimal point!
        median = (prev + curr) / 2.0
    end

    return median
end

a = [3]
b = [0]

puts "test 1 actual:"
puts find_median_sorted_arrays(a, b)
puts "expected median: 1.5"

a = [3]
b = [0, 1, 1, 1, 1, 1]

puts "test 2 actual:"
puts find_median_sorted_arrays(a, b)
puts "expected median: 1"

a = [-1]
b = [-2, 3]

puts "test 3 actual:"
puts find_median_sorted_arrays(a, b)
puts "expected median: -1"

a = [-1, 6, 7, 8, 9]
b = [-1]

puts "test 4 actual:"
puts find_median_sorted_arrays(a, b)
puts "expected median: 6.5"

a = [8]
b = [8]

puts "test 5 actual:"
puts find_median_sorted_arrays(a, b)
puts "expected median: 8"

a = [4]
b = [2]

puts "test 6 actual:"
puts find_median_sorted_arrays(a, b)
puts "expected median: 3"

a = []
b = [2]

puts "test 7 actual:"
puts find_median_sorted_arrays(a, b)
puts "expected median: 2"


a = []
b = [2, 3]

puts "test 8 actual:"
puts find_median_sorted_arrays(a, b)
puts "expected median: 2.5"