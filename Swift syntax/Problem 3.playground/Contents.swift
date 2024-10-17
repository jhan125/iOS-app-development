//MARK: Question 3, Find the Largest Numbers in a Group of Arrays

/*
 Create a function that takes an array of arrays with numbers. Return a new (single) array with the largest numbers of each.

 findLargest([[4, 2, 7, 1], [20, 70, 40, 90], [1, 2, 0]]) ➞ [7, 90, 2]

 findLargest([[-34, -54, -74], [-32, -2, -65], [-54, 7, -43]]) ➞ [-34, -2, 7]

 findLargest([[0.4321, 0.7634, 0.652], [1.324, 9.32, 2.5423, 6.4314], [9, 3, 6, 3], [1, 2, 3, 4]]) ➞ [0.7634, 9.32, 9, 4]
 
 It is OK, if your returning array is [Double]
 
 Borrowed from: edabit.com
 */

// Approach 1: Brute Force
func findLargest1(arrays:[[Double]]) -> [Double]{
    var result = [Double]()
    if !arrays.isEmpty {
        for array in arrays{
            var largest = array[0]
            for num in array{
                largest = max(largest, num)
            }
            result.append(largest)
        }
    }
    return result
}

// Approach 2: Using Array's max() method
// Reference: https://stackoverflow.com/questions/24036514/find-min-max-value-in-swift-array
func findLargest2(arrays:[[Double]]) -> [Double]{
    var result = [Double]()
    if !arrays.isEmpty {
        for array in arrays{
            var largest = array.max()!
            result.append(largest)
        }
    }
    
    return result
}

print("Test cases for Approach 1: Brute Force")
var arrayOfLargests1 = findLargest1(arrays: [[4, 2, 7, 1], [20, 70, 40, 90], [1, 2, 0]])
var arrayOfLargests2 = findLargest1(arrays: [[-34, -54, -74], [-32, -2, -65], [-54, 7, -43]])
var arrayOfLargests3 = findLargest1(arrays: [[0.4321, 0.7634, 0.652], [1.324, 9.32, 2.5423, 6.4314], [9, 3, 6, 3], [1, 2, 3, 4]])
print(arrayOfLargests1)
print(arrayOfLargests2)
print(arrayOfLargests3)
print("All test cases PASS!\n")

print("Test cases for Approach 2: Using Array's max() method")
arrayOfLargests1 = findLargest2(arrays: [[4, 2, 7, 1], [20, 70, 40, 90], [1, 2, 0]])
arrayOfLargests2 = findLargest2(arrays: [[-34, -54, -74], [-32, -2, -65], [-54, 7, -43]])
arrayOfLargests3 = findLargest2(arrays: [[0.4321, 0.7634, 0.652], [1.324, 9.32, 2.5423, 6.4314], [9, 3, 6, 3], [1, 2, 3, 4]])
print(arrayOfLargests1)
print(arrayOfLargests2)
print(arrayOfLargests3)
print("All test cases PASS!\n")
