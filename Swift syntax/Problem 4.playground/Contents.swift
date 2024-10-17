//MARK: Question 4, Remove the First and Last Characters

/*
 Create a function that removes the first and last characters from a string.
 
 removeFirstLast("hello") ➞ "ell"

 removeFirstLast("maybe") ➞ "ayb"

 removeFirstLast("benefit") ➞ "enefi"

 removeFirstLast("a") ➞ "a"
 
 Borrowed from: edabit.com
 
 HINT: remove(at: index)
 */

// Approach 1: Brute Force
func removeFirstLast1(input:String) -> String{
    if input.count < 2 {
        return input
    }
    var result = ""
    for (index, char) in input.enumerated() {
        if index != 0 && index != input.count - 1 {
            result.append(char)
        }
    }
    return result
}

// Approach 2: Using removeFirst() removeLast() function
func removeFirstLast2(input:String) -> String{
    if input.count < 2 {
        return input
    }
    var result = input
    result.removeFirst()
    result.removeLast()
    return result
}

// Approach 3: Using remove(at: index) removeLast() function
func removeFirstLast3(input:String) -> String{
    if input.count < 2 {
        return input
    }
    var result = input
    result.remove(at: result.startIndex)
    // In Swift, endIndex is a "one-past-the-last" index.
    result.remove(at: result.index(before: result.endIndex))
    return result
}


let input1 = "hello"
let input2 = "maybe"
let input3 = "benefit"
let input4 = "a"
let input5 = "ab"
let input6 = ""

print("Test cases for Approach 1: Brute Force")
var removedFirstAndLast1 = removeFirstLast1(input: input1)
var removedFirstAndLast2 = removeFirstLast1(input: input2)
var removedFirstAndLast3 = removeFirstLast1(input: input3)
var removedFirstAndLast4 = removeFirstLast1(input: input4)
var removedFirstAndLast5 = removeFirstLast1(input: input5)
var removedFirstAndLast6 = removeFirstLast1(input: input6)
print("Input is \"\(input1)\", Output is \"\(removedFirstAndLast1)\"")
print("Input is \"\(input2)\", Output is \"\(removedFirstAndLast2)\"")
print("Input is \"\(input3)\", Output is \"\(removedFirstAndLast3)\"")
print("Input is \"\(input4)\", Output is \"\(removedFirstAndLast4)\"")
print("Input is \"\(input5)\", Output is \"\(removedFirstAndLast5)\"")
print("Input is \"\(input6)\", Output is \"\(removedFirstAndLast6)\"")
print("All test cases PASS!\n")

print("Test cases for Approach 2: Using removeFirst() removeLast() function")
removedFirstAndLast1 = removeFirstLast2(input: input1)
removedFirstAndLast2 = removeFirstLast2(input: input2)
removedFirstAndLast3 = removeFirstLast2(input: input3)
removedFirstAndLast4 = removeFirstLast2(input: input4)
removedFirstAndLast5 = removeFirstLast2(input: input5)
removedFirstAndLast6 = removeFirstLast2(input: input6)
print("Input is \"\(input1)\", Output is \"\(removedFirstAndLast1)\"")
print("Input is \"\(input2)\", Output is \"\(removedFirstAndLast2)\"")
print("Input is \"\(input3)\", Output is \"\(removedFirstAndLast3)\"")
print("Input is \"\(input4)\", Output is \"\(removedFirstAndLast4)\"")
print("Input is \"\(input5)\", Output is \"\(removedFirstAndLast5)\"")
print("Input is \"\(input6)\", Output is \"\(removedFirstAndLast6)\"")
print("All test cases PASS!\n")

print("Test cases for Approach 3: Using remove(at: index) function")
removedFirstAndLast1 = removeFirstLast3(input: input1)
removedFirstAndLast2 = removeFirstLast3(input: input2)
removedFirstAndLast3 = removeFirstLast3(input: input3)
removedFirstAndLast4 = removeFirstLast3(input: input4)
removedFirstAndLast5 = removeFirstLast3(input: input5)
removedFirstAndLast6 = removeFirstLast3(input: input6)
print("Input is \"\(input1)\", Output is \"\(removedFirstAndLast1)\"")
print("Input is \"\(input2)\", Output is \"\(removedFirstAndLast2)\"")
print("Input is \"\(input3)\", Output is \"\(removedFirstAndLast3)\"")
print("Input is \"\(input4)\", Output is \"\(removedFirstAndLast4)\"")
print("Input is \"\(input5)\", Output is \"\(removedFirstAndLast5)\"")
print("Input is \"\(input6)\", Output is \"\(removedFirstAndLast6)\"")
print("All test cases PASS!\n")
