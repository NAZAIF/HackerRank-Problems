import Foundation

// problem to return 12 hr time to 24 hr time

func timeConversion(s: String) -> String{
    let index = s.firstIndex(of: ":")!
    let hour = s[..<index]
    var newStr = String()
    var num: Int! = Int(hour)
    if s.contains("P") {
        if num != 12 {
            num += 12
        }
        newStr = "\(num!)\(s[index...])"
    } else {
        if num == 12 {
            newStr = "00\(s[index...])"
        } else {
            newStr = s
        }
    }
    newStr.removeLast(2)
    return newStr
}


timeConversion(s: "07:05:45PM")
