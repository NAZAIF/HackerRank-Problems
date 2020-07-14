import Foundation

// Complete the extraLongFactorials function below.
func extraLongFactorials(n: Int) -> Void {
    if n == 1 {
        print(1)
    } else {
        var result = [1]
        for i in 2...n {
            result = result.map { $0 * i }
            result = carryAll(result)
        }
        print(result.map(String.init).joined())
    }
}

func carryAll(_ arr: [Int]) -> [Int] {
    var result = [Int]()

    var carry = 0
    for val in arr.reversed() {
        let total = val + carry
        let digit = total % 10
        carry = total / 10
        result.append(digit)
    }

    while carry > 0 {
        let digit = carry % 10
        carry = carry / 10
        result.append(digit)
    }

    return result.reversed()
}

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

extraLongFactorials(n: n)
