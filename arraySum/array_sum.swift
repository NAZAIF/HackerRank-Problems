import Foundation

print("Input space separated array below")

let nums = readLine()?.components(separatedBy: .whitespaces).compactMap { Int($0) }
let sum = nums?.reduce(0, +)
print("sum:", sum!)
