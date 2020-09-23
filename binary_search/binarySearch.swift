import Foundation

let a = [3,245,23,6,7,4,314,64,34,62,77,54,24,2,67,778]
let s = 24

var l = 0
var u = a.count - 1

func returnIndex() -> Int?{
    let arr = a.sorted()
    while(l <= u) {
        let p:Int = (l + u)/2
        if arr[p] == s {
            return p
        } else if s > arr[p] {
            l = p + 1
        } else {
            u = p - 1
        }
    }
    return nil
}

print(returnIndex())

