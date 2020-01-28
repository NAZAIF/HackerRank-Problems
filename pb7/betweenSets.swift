import Foundation

/*
 * Complete the 'getTotalX' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts following parameters:
 *  1. INTEGER_ARRAY a
 *  2. INTEGER_ARRAY b
 */

func getTotalX(a: [Int], b: [Int]) -> Int {
    // Write your code here
    var count = 0
    for i in stride(from: a.sorted().last ?? 0, through: b.sorted().first ?? 0, by: 1) {
        if checkValueFactorOf(arr: a, factor: i) {
            if checkAllAreFactors(arr: b, factor: i) {
                count += 1
            }
        }
    }
    return count
}

func checkValueFactorOf(arr: [Int], factor: Int) -> Bool {
    for each in arr {
        if !factor.isMultiple(of: each) {
            return false
        }
    }
    return true
}

func checkAllAreFactors(arr: [Int], factor: Int) -> Bool {
    for each in arr {
        if !each.isMultiple(of: factor) {
            return false
        }
    }
    return true
}


let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let firstMultipleInputTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let firstMultipleInput = firstMultipleInputTemp.split(separator: " ").map{ String($0) }

guard let n = Int(firstMultipleInput[0])
else { fatalError("Bad input") }

guard let m = Int(firstMultipleInput[1])
else { fatalError("Bad input") }

guard let arrTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let arr: [Int] = arrTemp.split(separator: " ").map {
    if let arrItem = Int($0) {
        return arrItem
    } else { fatalError("Bad input") }
}

guard arr.count == n else { fatalError("Bad input") }

guard let brrTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let brr: [Int] = brrTemp.split(separator: " ").map {
    if let brrItem = Int($0) {
        return brrItem
    } else { fatalError("Bad input") }
}

guard brr.count == m else { fatalError("Bad input") }

let total = getTotalX(a: arr, b: brr)

fileHandle.write(String(total).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)

