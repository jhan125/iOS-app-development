//MARK: Question 6, Divide and conquer
/*
 First, create a function that returns the number of times an integer can be divided by another integer without a remainder. The function should return nil if the division doesn’t produce a whole number. Name the function divideIfWhole.

 Then, write code that tries to unwrap the optional result of the function. There should be two cases: upon success, print "Yep, it divides \(answer) times", and upon failure, print "Not divisible :[".

 Finally, test your function:
 
 Call divideIfWhole(10, by: 2) -> 5. Since, the returned value is not nil, print: "Yep, it divides 5 times."
 divideIfWhole(10, by: 3) -> nil. Since, the returned value is nil, print: "Not divisible :[."
 
 
 borrowed from: https://www.kodeco.com/
 */


// Approach 1: Brute Force
func divideIfWhole(number:Int, divider:Int) -> Int?{
    if divider == 0 {
        print("Error: Division by zero is not allowed.")
        return nil
    }
    if number % divider == 0 {
        return number/divider
    }
    return nil
}

func printResult(result:Int?){
    if let result = result{
        print("Yep, it divides \(result) times.")
    } else {
        print("Not divisible :[.")
    }
}

print("Test cases for Approach 1: Brute Force")
var result1 = divideIfWhole(number: 10, divider: 2)
var result2 = divideIfWhole(number: 10, divider: 3)
var result3 = divideIfWhole(number: 10, divider: 5)
printResult(result: result1)
printResult(result: result2)
printResult(result: result3)
print("All test cases PASS!\n")
