import Foundation

func getNumbersWithPredicate(condition: (Int) -> Bool, numbers: [Int]) -> [Int] {
    var result = [Int]()
    for num in numbers {
        if condition(num) {
            result.append(num)
        }
    }
    return result
}

let filteredValues = getNumbersWithPredicate(condition: { (value) -> Bool in
    value > 15
}, numbers: [34,2,7,15,14])
print(filteredValues)

func greaterThan5(_ value: Int) -> Bool {
    return value > 5
}

func isEven(_ value: Int) -> Bool {
    return value.isMultiple(of: 2)
}

let greaterThan5Values = getNumbersWithPredicate(condition: greaterThan5(_:), numbers: [3,5,6,7])
print(greaterThan5Values)

let evenValues = getNumbersWithPredicate(condition: isEven(_:), numbers: [0,1,2,3,4,5,6,7,8,9,10,99])
print(evenValues)
