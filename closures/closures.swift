import Foundation

func getNumbersWithPredicate(condition: (Int) -> Bool, numbers: [Int]) -> [Int] {
    var result = [Int]()
    numbers.forEach {
        if condition($0) {
            result.append($0)
        }
    }
    return result
}

let filteredValues = getNumbersWithPredicate(condition: { (value) -> Bool in
    value > 15
}, numbers: [34,2,7,15,14])
print(filteredValues)

func greaterThan5(value: Int) -> Bool {
    return value > 5
}

func isEven(value: Int) -> Bool {
    return value.isMultiple(of: 2)
}

let greaterThan5Values = getNumbersWithPredicate(condition: greaterThan5, numbers: [3,5,6,7])
print(greaterThan5Values)

let evenValues = getNumbersWithPredicate(condition: isEven, numbers: [0,1,2,3,4,5,6,7,8,9,10,99])
print(evenValues)
