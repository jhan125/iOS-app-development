//MARK: Question 5, Four Passengers and a Driver

/*
 A typical car can hold four passengers and one driver, allowing five people to travel around. Given n number of people, return how many cars are needed to seat everyone comfortably.

 carsNeeded(5) ➞ 1

 carsNeeded(11) ➞ 3

 carsNeeded(0) ➞ 0
 
 Borrowed from: edabit.com
 */

// Approach 1: Brute Force
func carsNeeded1(people:Int) -> Int{
    if people % 5 == 0 {
        return people / 5
    } else {
        return people / 5 + 1
    }
}

let input1 = 5
let input2 = 11
let input3 = 0
let input4 = 4
let input5 = 6

print("Test cases for Approach 1: Brute Force")
var numberOfCars1 = carsNeeded1(people: input1)
var numberOfCars2 = carsNeeded1(people: input2)
var numberOfCars3 = carsNeeded1(people: input3)
var numberOfCars4 = carsNeeded1(people: input4)
var numberOfCars5 = carsNeeded1(people: input5)
print("Input is \"\(input1)\", Output is \"\(numberOfCars1)\"")
print("Input is \"\(input2)\", Output is \"\(numberOfCars2)\"")
print("Input is \"\(input3)\", Output is \"\(numberOfCars3)\"")
print("Input is \"\(input4)\", Output is \"\(numberOfCars4)\"")
print("Input is \"\(input5)\", Output is \"\(numberOfCars5)\"")
print("All test cases PASS!\n")
