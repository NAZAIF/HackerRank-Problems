import Foundation

// Complete the dayOfProgrammer function below.
func dayOfProgrammer(year: Int) -> String {
    if year > 1918 {
        if year.isMultiple(of: 400) || year.isMultiple(of: 4) && !year.isMultiple(of: 100) {
            return "12.09.\(year)"
        } else {
            return "13.09.\(year)"
        }
    } else if year < 1918 {
        if year.isMultiple(of: 4) {
            return "12.09.\(year)"
        } else {
            return "13.09.\(year)"
        }
    }
    
    
    return "26.09.1918"
}


let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let year = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

let result = dayOfProgrammer(year: year)

fileHandle.write(result.data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)

