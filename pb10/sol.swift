import Foundation

// Complete the hourglassSum function below.
func hourglassSum(arr: [[Int]]) -> Int {
var sumArr = [Int]()

for i in 1...4 {
    for j in 1...4 {
        var sum = 0
        sum += arr[i][j]
        for n in j-1...j+1 {
            sum += arr[i-1][n]
            sum += arr[i+1][n]
        }
        sumArr.append(sum)
    }
}

for i in 0..<sumArr.count {
    for j in i+1..<sumArr.count {
        if sumArr[j] > sumArr[i] {
            sumArr[i] = sumArr[j] + sumArr[i]
            sumArr[j] = sumArr[i] - sumArr[j]
            sumArr[i] = sumArr[i] - sumArr[j]
        }
    }
}

return sumArr.first!

}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

let arr: [[Int]] = AnyIterator{ readLine() }.prefix(6).map {
    let arrRow: [Int] = $0.split(separator: " ").map {
        if let arrItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
            return arrItem
        } else { fatalError("Bad input") }
    }

    guard arrRow.count == 6 else { fatalError("Bad input") }

    return arrRow
}

guard arr.count == 6 else { fatalError("Bad input") }

let result = hourglassSum(arr: arr)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)

