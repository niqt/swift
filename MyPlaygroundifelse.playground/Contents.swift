import Cocoa

var month = 12
var year = 2020
var day = 31

if day != 31 && month == 12 && year == 2020 {
    print("It's not the end of the year")
} else if (day == 31 && month == 12 && year == 2020) ||
          (day == 1 && month == 1 && year == 2021) {
    print("Happy new year")
} else {
    print("Good day")
}

/*
for i in 1...10 {
    print(i) // From 0 to 10
}

for i in 0..<10 {
    print(i) // From 0 to 9
}

for i in (0..<10).reversed() {
    print(i) // From 9 to 0
}
 */

var i = 0

while i < 10 {
    print(i) // 0 to 9
    i = i + 1
}

repeat {
    print(i) // 10 to 1
    i = i - 1
} while i >= 1


