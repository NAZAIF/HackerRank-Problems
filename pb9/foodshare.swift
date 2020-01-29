import Foundation

// Complete the bonAppetit function below.
func bonAppetit(bill: [Int], k: Int, b: Int) -> Void {
    var sum = 0
    for i in 0..<bill.count {
        if i != k {
           sum += bill[i]
        }
    }
    sum /= 2
    if b == sum {
        print("Bon Appetit")
    } else {
        print(b-sum)
    }
}

guard let nkTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let nk = nkTemp.split(separator: " ").map{ String($0) }

guard let n = Int(nk[0])
else { fatalError("Bad input") }

guard let k = Int(nk[1])
else { fatalError("Bad input") }

guard let billTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let bill: [Int] = billTemp.split(separator: " ").map {
    if let billItem = Int($0) {
        return billItem
    } else { fatalError("Bad input") }
}

guard bill.count == n else { fatalError("Bad input") }

guard let b = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

bonAppetit(bill: bill, k: k, b: b)

