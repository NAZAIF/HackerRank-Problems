import Foundation

// Complete the reverseArray function below.
func reverseArray(a: [Int]) -> [Int] {
    var rev = [Int]()
    for i in stride(from:a.count - 1, to:-1, by: -1){
        rev.append(a[i])
    }
    return rev


}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let arrCount = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let arrTemp = readLine() else { fatalError("Bad input") }
let arr: [Int] = arrTemp.split(separator: " ").map {
    if let arrItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return arrItem
    } else { fatalError("Bad input") }
}

guard arr.count == arrCount else { fatalError("Bad input") }

let res = reverseArray(a: arr)

fileHandle.write(res.map{ String($0) }.joined(separator: " ").data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
