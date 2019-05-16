import Foundation



guard let ndTemp = readLine() else { fatalError("Bad input") }
let nd = ndTemp.split(separator: " ").map{ String($0) }

guard let n = Int(nd[0].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let d = Int(nd[1].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let aTemp = readLine() else { fatalError("Bad input") }
var a: [Int] = aTemp.split(separator: " ").map {
    if let aItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return aItem
    } else { fatalError("Bad input") }
}

guard a.count == n else { fatalError("Bad input") }

for i in 0 ..< d {
  a.append(a.removeFirst())
}

for i in 0 ..< n {
    print("\(a[i])",terminator: " ")
}
