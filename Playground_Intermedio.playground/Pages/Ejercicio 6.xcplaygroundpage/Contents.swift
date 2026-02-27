//: [Previous](@previous)

import Foundation

// Create an algorithm that generates multiplication tables from 1 to 10.

for i in 1...10 {
    print("\(i) times table:")
    for j in 1...10 {
        print("\(i) x \(j) = \(i*j)")
    }
    print("---------------------------")
}

// Another way using while:
var i = 1
while i <= 10 {
    print("\(i) times table:")
    var j = 1
    while j <= 10 {
        print("\(i) x \(j) = \(i*j)")
        j += 1
    }
    print("---------------------------")
    i += 1
}

// Another way using a FUNCTION ---

func multiplicationTables() {
    for i in 1...10 {
        print("\(i) times table:")
        for j in 1...10 {
            print("\(i) x \(j) = \(i*j)")
        }
        print("---------------------------")
    }
}

multiplicationTables()

func multiplicationTables(_ num: Int) {
    if num >= 1 && num <= 10 {
        for i in 1...10 {
            print("\(num) x \(i) = \(num*i)")
        }
        print("---------------------------")
    } else {
        print("The number must be between 1 and 10.")
    }
}

func multiplicationTables2(_ num: Int) -> [Int] {
    var arrayNums: [Int] = []
    if num >= 1 && num <= 10 {
        for i in 1...10 {
            var result = num * i
            arrayNums.append(result)
        }
    } else {
        print("The number must be between 1 and 10.")
    }
    print(arrayNums)
    return arrayNums
}

print(multiplicationTables2(3))

// Another way using .map()

func printMultiplicationTable(of i: Int = 10) -> [Int] {
    (1...10).map { i * $0 }
}
print(printMultiplicationTable(of: 4))

func multiple(number: Int, until num: Int = 12) -> [Int] {
     Array(1...num).map({ $0 * number })
}
    
let num = 5
let tabla = multiple(number: num)
print("Tabla del \(num): \(tabla)")

// Using .map() with a dictionary
let scores = ["Ana": 95, "Bob": 87, "Carl": 92]
let descriptions = scores.map { "Student \($0) scored \($1)" }
print(descriptions)

//: [Next](@next)
