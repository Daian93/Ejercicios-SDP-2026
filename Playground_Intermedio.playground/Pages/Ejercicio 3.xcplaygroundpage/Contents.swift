//: [Previous](@previous)

import Foundation

// Given a month of the year, indicate how many days it has.

var month: String = "SEPTember"
month = month.lowercased().capitalized

if month == "February" {
    print("\(month) has 28 days.")
} else if month == "April" || month == "June" || month == "September" || month == "November" {
    print("\(month) has 30 days.")
} else if month == "January" || month == "March" || month == "May" || month == "July" || month == "August" || month == "October" || month == "December" {
    print("\(month) has 31 days.")
} else {
    print("The month \(month) does not exists.")
}

// Another way with a switch:
switch month {
case "February": print("\(month) has 28 days.")
case "April", "June", "September", "November": print("\(month) has 30 days.")
case "January", "March", "May", "July", "August", "October", "December": print("\(month) has 31 days.")
default: print("The month \(month) does not exists.")
}

// Another way with a dictionary:
let months: [String: Int] = ["January": 31, "February": 28, "March": 31, "April": 30, "May": 31, "June": 30, "July": 31, "August": 31, "September": 30, "October": 31, "November": 30, "December": 31]

    if let days = months[month] {
        print("The month \(month) has \(days) days.")
    } else {
        print("The month \(month) does not exists.")
    }



//: [Next](@next)
