//: [Previous](@previous)

import Foundation

/* Create an algorithm that calculates the distance between two points on a Cartesian plane. The points are defined by their coordinates: (x1, y1) and (x2, y2). Note: The formula for calculating the distance between two points on a Cartesian plane is: Distance = (x2− x1)^2 + (y2− y1)^2. To calculate the square root, use a predefined process called sqrt. */

let x1 = 1
let y1 = 2
let x2 = 4
let y2 = 6

let difx = x2 - x1
let dify = y2 - y1
let distance = sqrt(Double(difx * difx + dify * dify))

/* Another way
 let distance = sqrt(Double(pow(Double(difx), 2) + pow(Double(dify), 2)))
 */

print("The distance between the two points is: \(String(format: "%.2f", distance))")

//: [Next](@next)
