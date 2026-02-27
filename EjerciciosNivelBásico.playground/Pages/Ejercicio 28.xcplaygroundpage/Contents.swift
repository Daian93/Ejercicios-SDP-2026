//: [Previous](@previous)

import Foundation

/*: Desarrolla un algoritmo que encuentre la subsecuencia creciente más larga en un array. */

/* Important: It should be noted that unlike a ‘substring’, a subsequence does not require the elements to be contiguous in the original array, but they must maintain their relative order. */

let numbers = [10, 22, 9, 33, 21, 50, 41, 60]

// Array to store LIS length at each index
var lis = Array(repeating: 1, count: numbers.count)

// Compute LIS lengths
for i in 1..<numbers.count {
    for j in 0..<i {
        if numbers[i] > numbers[j] {
            lis[i] = max(lis[i], lis[j] + 1)
        }
    }
}

// Find maximum LIS
let maxLength = lis.max() ?? 0

// Reconstruct one LIS sequence
var sequence: [Int] = []
var currentLength = maxLength
for i in (0..<numbers.count).reversed() {
    if lis[i] == currentLength {
        sequence.insert(numbers[i], at: 0)
        currentLength -= 1
    }
}

print("Array: \(numbers)")
print("Length of LIS: \(maxLength)")
print("One Longest Increasing Subsequence: \(sequence)")

//: [Next](@next)
