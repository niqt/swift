import Cocoa

var str = "I'm variable"

let const = "I'm costant"

var number: Int

var numberInit: Int = 0

var numberDirectInit = 0

var myOpt: Int?

myOpt = 3
if let value = myOpt {
    print("Value \(value)")
} else {
    print("optional")
}

var tupla: (String, String)
tupla = ("Bob", "48")

var nameYear: (name: String, years: Int)

nameYear.years = 49
nameYear.name = "Bob"

var vector: Array<Int>

vector = Array<Int>()

vector.append(3)

for i in 0..<vector.count {
    print("Vector[\(i)] = \(vector[i])")
}

for elem in vector {
    print(elem)
}


var name = "Bob"

for i in name.indices {
    print(name[i])
}

var dict: [Int: String] = [Int: String]()
dict[404] = "Not found"

for key in dict.keys {
    print(key)
}

for value in dict.values {
    print(value)
}

func simplePrint() {
    print("You are a geek")
}

simplePrint()

var counter = 10
while counter > 0 {
    print(counter)
    counter = counter - 1
}

repeat {
    print(counter)
    counter = counter + 1
} while counter < 10

func nameLastName(name a: String, lastname b: String ) {
    print("Name \(a) Lastname \(b)")
}

nameLastName(name: "Bob", lastname: "Rossi")

func label(a: String, b: String ) {
    print(a + b)
}

label(a: "Giorgio", b: "White")

func labeltwo(_ a: String, b: String ) {
    print(a + b)
}

labeltwo("Alice", b: "White")


func squareRect(width: Int, height: Int) -> Int {
    let sup = width * height
    return sup
}

print(squareRect(width: 4, height: 5))

func swap(a: inout Int, b: inout Int) {
    let dum = a
    a = b
    b = dum
}

var first = 3
var second = 4

swap(a: &first, b: &second)

print("First = \(first) and Second = \(second)")

var numbers = [1, 2, 3, 4, 5]

var triple = numbers.map({(number: Int) -> Int in return number * 3 })

print(triple)

let ordered = triple.sorted {$0 > $1}

print(ordered)


enum Polar: Int {
    case north = 1
    case sud, west, est
    func description() -> String{
        switch self {
        case .north:
            return "North"
        case .est:
            return "Est"
        case .west:
            return "West"
        case .sud:
            return "Sud"
        }
    }
}


var sanFrancisco = Polar.west

print(sanFrancisco.description())

struct Coordinate {
    var lat: Double
    var long: Double
}

var sanJose = Coordinate(lat: 37.3382, long: 121.8863)

class ClassCoordinate {
    var lat: Double
    var lon: Double
    init(lat: Double, lon: Double) {
        self.lat = lat
        self.lon = lon
    }
    
    func invert() {
        let dum = lat
        lat = lon
        lon = dum
    }
}

protocol PrintInfoProtocol {
    var simpleLabel: String { get }
    mutating func translate()
}

class ClassCoordinateTraslate: PrintInfoProtocol {
    var lat: Double
    var lon: Double
    init(lat: Double, lon: Double) {
        self.lat = lat
        self.lon = lon
    }
    
    func invert() {
        let dum = self.lat
        self.lat = self.lon
        self.lon = dum
    }
    
    var simpleLabel = "Coordinates"
    func translate() {
        self.lat = self.lat + 1
        self.lon = self.lon + 1
    }
}


class Audio {
    var mic: Bool
    var voice: Bool
    
    init(mic: Bool, voice: Bool) {
        self.mic = mic
        self.voice = voice
    }
    
    init() {
        self.mic = true
        self.voice = true
    }
    
    func mute() {
        mic = false
    }
    
    func unmute() {
        mic = true
    }
}

class SmartPhone: Audio {
    var touchscreen: Bool
    var physicalKeyboard: Bool
    init(touch: Bool, keyboard: Bool) {
        self.physicalKeyboard = keyboard
        self.touchscreen = touch
        super.init(mic: true, voice: true)
    }
    func lockScreen() {
        touchscreen = false
    }
    
    func unLockScreen() {
        touchscreen = true
    }
}
