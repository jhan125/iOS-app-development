//MARK: Question 1, Concatenating Two Integers

/* Create a function to concatenate two integer arrays.
 concatenate([1, 3, 5], [2, 6, 8]) ➞ [1, 3, 5, 2, 6, 8]

 concatenate([7, 8], [10, 9, 1, 1, 2]) ➞ [7, 8, 10, 9, 1, 1, 2]

 concatenate([4, 5, 1], [3, 3, 3, 3, 3]) ➞ [4, 5, 1, 3, 3, 3, 3, 3]
 
 Do not forget to return the resulting array.
 
 Borrowed from: edabit.com
 */

// Approach 1: Brute Force
func concatenate1(array1:[Int], array2:[Int]) -> [Int] {
    var result = [Int]()
    for number in array1{
        result.append(number)
    }
    for number in array2{
        result.append(number)
    }
    return result
}

// Approach 2: Using generic operator
// Reference: https://stackoverflow.com/questions/25146382/how-do-i-concatenate-or-merge-arrays-in-swift
func concatenate2(array1:[Int], array2:[Int]) -> [Int] {
    return array1 + array2
}

// Approach 3: Using append(contentsOf:) method
// Reference: https://stackoverflow.com/questions/25146382/how-do-i-concatenate-or-merge-arrays-in-swift
func concatenate3(array1:[Int], array2:[Int]) -> [Int] {
    var result = array1
    result.append(contentsOf: array2)
    return result
}

print("Test cases for Approach 1: Brute Force")
var concatenatedArray1 = concatenate1(array1:[1, 3, 5], array2: [2, 6, 8])
var concatenatedArray2 = concatenate1(array1:[7, 8], array2: [10, 9, 1, 1, 2])
var concatenatedArray3 = concatenate1(array1:[4, 5, 1], array2: [3, 3, 3, 3, 3])
var concatenatedArray4 = concatenate1(array1:[], array2: [3, 3, 3, 3, 3])
print(concatenatedArray1)
print(concatenatedArray2)
print(concatenatedArray3)
print(concatenatedArray4)
print("All test cases PASS!\n")

print("Test cases for Approach 2: Using generic operator")
concatenatedArray1 = concatenate2(array1:[1, 3, 5], array2: [2, 6, 8])
concatenatedArray2 = concatenate2(array1:[7, 8], array2: [10, 9, 1, 1, 2])
concatenatedArray3 = concatenate2(array1:[4, 5, 1], array2: [3, 3, 3, 3, 3])
concatenatedArray4 = concatenate1(array1:[], array2: [3, 3, 3, 3, 3])
print(concatenatedArray1)
print(concatenatedArray2)
print(concatenatedArray3)
print(concatenatedArray4)
print("All test cases PASS!\n")

print("Test cases for Approach 3: Using append(contentsOf:) method")
concatenatedArray1 = concatenate3(array1:[1, 3, 5], array2: [2, 6, 8])
concatenatedArray2 = concatenate3(array1:[7, 8], array2: [10, 9, 1, 1, 2])
concatenatedArray3 = concatenate3(array1:[4, 5, 1], array2: [3, 3, 3, 3, 3])
concatenatedArray4 = concatenate1(array1:[], array2: [3, 3, 3, 3, 3])
print(concatenatedArray1)
print(concatenatedArray2)
print(concatenatedArray3)
print(concatenatedArray4)
print("All test cases PASS!\n")
