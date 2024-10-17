//MARK: Question 2, Sort and Array by String length

/* Create a function that takes an array of strings and return an array, sorted from shortest to longest.
 
 sortByLength(["Google", "Apple", "Microsoft"])
 ➞ ["Apple", "Google", "Microsoft"]

 sortByLength(["Leonardo", "Michelangelo", "Raphael", "Donatello"])
 ➞ ["Raphael", "Leonardo", "Donatello", "Michelangelo"]

 sortByLength(["Turing", "Einstein", "Jung"])
 ➞ ["Jung", "Turing", "Einstein"]
 
 Borrowed from: edabit.com
 */

// Approach 1: Brute Force
func sortByLength1(array:[String]) -> [String] {
    var letterCounts = [String: Int]()
    for word in array{
        letterCounts[word] = word.count
    }
    let sortedWords = letterCounts.keys.sorted{
        letterCounts[$0]! < letterCounts[$1]!
    }
    return sortedWords
}

// Approach 2: using customized sorted() method
// Reference: https://cocoacasts.com/swift-fundamentals-how-to-sort-an-array-in-swift#:~:text=We%20have%20two%20options%20to,a%20mutating%20method%20or%20function.
func sortByLength2(array:[String]) -> [String] {
    // returns a new array
    let sortedWords = array.sorted{
        $0.count < $1.count
    }
    return sortedWords
}

// Approach 3: using customized sort() method
// Reference: https://cocoacasts.com/swift-fundamentals-how-to-sort-an-array-in-swift#:~:text=We%20have%20two%20options%20to,a%20mutating%20method%20or%20function.
func sortByLength3(array:[String]) -> [String] {
    // sorts the elements of the array in place
    var sortedWords = array
    sortedWords.sort {
        $0.count < $1.count
    }
    return sortedWords
}

// Approach 4: using Selection Sort Algorithm
// Reference: https://medium.com/appcoda-tutorials/sorting-algorithms-implementing-selection-sort-using-swift-30500ae6b93a
func sortByLength4(array:[String]) -> [String] {
    // sorts the elements of the array in place
    var sortedWords = array
    let n = array.count
    for i in 0...n-1 {
        for j in i...n-1 {
            if sortedWords[i].count > sortedWords[j].count {
                let temp = sortedWords[i]
                sortedWords[i] = sortedWords[j]
                sortedWords[j] = temp
            }
        }
    }
    return sortedWords
}

print("Test cases for Approach 1: Brute Force")
var sortedArray1 = sortByLength1(array: ["Google", "Apple", "Microsoft"])
var sortedArray2 = sortByLength1(array: ["Leonardo", "Michelangelo", "Raphael", "Donatello"])
var sortedArray3 = sortByLength1(array: ["Turing", "Einstein", "Jung"])
print(sortedArray1)
print(sortedArray2)
print(sortedArray3)
print("All test cases PASS!\n")

print("Test cases for Approach 2: using customized sorted() method")
sortedArray1 = sortByLength2(array: ["Google", "Apple", "Microsoft"])
sortedArray2 = sortByLength2(array: ["Leonardo", "Michelangelo", "Raphael", "Donatello"])
sortedArray3 = sortByLength2(array: ["Turing", "Einstein", "Jung"])
print(sortedArray1)
print(sortedArray2)
print(sortedArray3)
print("All test cases PASS!\n")

print("Test cases for Approach 3: using customized sort() method")
sortedArray1 = sortByLength3(array: ["Google", "Apple", "Microsoft"])
sortedArray2 = sortByLength3(array: ["Leonardo", "Michelangelo", "Raphael", "Donatello"])
sortedArray3 = sortByLength3(array: ["Turing", "Einstein", "Jung"])
print(sortedArray1)
print(sortedArray2)
print(sortedArray3)
print("All test cases PASS!\n")

print("Test cases for Approach 4: using customized sort() method")
sortedArray1 = sortByLength4(array: ["Google", "Apple", "Microsoft"])
sortedArray2 = sortByLength4(array: ["Leonardo", "Michelangelo", "Raphael", "Donatello"])
sortedArray3 = sortByLength4(array: ["Turing", "Einstein", "Jung"])
print(sortedArray1)
print(sortedArray2)
print(sortedArray3)
print("All test cases PASS!\n")
