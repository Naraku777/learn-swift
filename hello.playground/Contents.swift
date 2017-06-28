//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"



// let 声明常量，var 声明变量

var someVariable = 1
someVariable = 2

let SOME_CONSTANT = 0
// SOME_CONSTANT = 1 // => error

// 👆 没有声明类型则自动推断类型

let implicitInteger        = 70 // => 70
let implicitDouble         = 70.0 // => 70.0
let explicitDouble: Double = 70 // => 70.0

let someFloat: Float = 4

// 值永远不会被隐式转换为其他类型
// 需要时显式转换

let label = "The width is "
let width = 94
let widthLabel = label + String(width) // 不转换会提示不能将两个类型相加

// 一种简单的把值转换成字符串的方法
// 把值写在括号中，并且在括号前加一个反斜杠

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

let age: Float = 12.5
//let greeting = "Hi, \(age) old boy."

// 数组和字典
// 用下标活着 key 来访问元素

var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"

var occupations = [
    "Malcolm": "Captain",
    "Keylee": "Mechanic", // => 可以留个逗号
]
occupations["Jayne"] = "Public Relations"


// 创建空数组或字典，要使用初始化语法

let emptyArray = [String]()
let emptyDictionary = [String: Float]()

// 如果类型可以推断出来

shoppingList = []
occupations = [:]


// 控制流

// 使用 if 和 switch 来进行条件操作
// 使用 for-in、for、while 和 repeat-while 来进行循环
// 条件括号可以省略

let individualSoures = [74, 43, 103, 87, 12]
var teamScore = 0
for score in individualSoures{
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

// if 条件必须是一个布尔表达式，if score {...} 将会报错


// 可以使用 if 和 let 来处理缺失的情况
// nil 表值缺失
// 在类型后面加一个问号来标记这个变量值是可选的

var optionalString: String? = "Hello"
print(optionalString == nil)

//var optionalName: String? = "John Appleseed"
var optionalName: String? = nil
var greeting = "Hello!"
if let name = optionalName{
    greeting = "Hello, \(name)"
} else{
    greeting = "No greeting."
}

// 如果变量的可选值是 nil，条件会判断为 false
// 否则赋值给后面的 let 常量，代码块可用该值


// 另一种处理方法通过使用 ?? 操作符来提供一个默认值

let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi, \(nickName ?? fullName)"


// switch 支持任意类型

let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}


// for-in 遍历字典
// 需要两个变量来表示每个键值对。
// 字典是一个无序集合，所以她们的键值以任意顺序迭代结束

let interestingNumber = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
var largestKind = ""
for (kind, numbers) in interestingNumber {
    for number in numbers{
        if number > largest {
            largest = number
            largestKind = kind
        }
    }
}
print(largest)
print(largestKind)


// while
var n = 2
while n < 100 {
    n = n * 2
}
print(n)

var m = 2
repeat {
    m = m * 2
} while m < 100
print(m)


// 可以在循环中使用 ..< 表示范围

var total = 0
for i in 0..<4 { // 包含上界 0...4
    total += i
}
print(total)



// 函数和闭包
// -> 指定返回类型

func greet(person: String, day: String, hasLunch: Bool) -> String {
    let _hasLunch = hasLunch
        ? "I am already had lunch"
        : "I have nothing to eat at lunch"
    return "Hello \(person), today is \(day). \(_hasLunch)"
}
greet(person: "Bob", day: "Tuesday", hasLunch: true)


// 默认情况下，函数使用它们的参数名称作为它们参数的标签
// 在参数名称前可以自定义参数标签，或者使用 _ 表示不使用参数标签

func greetAlias(_ person: String, on day: String) -> String{
    return "Hello \(person), today is \(day)."
}
greetAlias("John", on: "Wednesday")


// 使用元组可以让一个函数返回多个值，该元组的元素可以用名称或数字表示

func caculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int){
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores{
        if score > max {
            max = score
        } else if score < min{
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}

let statistics = caculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.2)


// 函数可以带有可变个数的参数，这些参数在函数内表现为数组的形式

func sumOf(numbers: Int...) -> Int{
    var sum = 0
    for num in numbers {
        sum += num
    }
    return sum
}
sumOf()
sumOf(numbers: 42, 597, 12)


// 函数可以嵌套。被嵌套的函数可以访问外侧函数的变量，你可以使用嵌套函数来重构一个太长或者太复杂的函数。

func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()


// 函数是第一等类型，这意味着函数可以作为另一个函数的返回值。

func makeIncrementer() -> ((Int) -> Int){
    func addOne(num: Int) -> Int{
        return num + 1
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)


// 函数也可以当作参数传入另一个函数

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool{
    for item in list{
        if condition(item){
            return true
        }
    }
    return false
}
func lessThanTen(num: Int) -> Bool{
    return num < 10
}
var nums = [20, 19, 7, 12]
hasAnyMatches(list: nums, condition: lessThanTen)



// 函数实际上是一种特殊的闭包:它是一段能之后被调取的代码。闭包中的代码能访问闭包作用域中的变量和函数，
// 即使闭包是在一个不同的作用域被执行的 - 你已经在嵌套函数的例子中看过了。你可以使用 {} 来创建一个匿名闭包。
// 使用 in 将参数和返回值类型的声明与闭包函数体进行分离。


print(nums.map({
    (num: Int) -> Int in
    let result = 3 * num
    return result
}))

print(nums.map({
    (num: Int) -> Int in
    if num % 2 != 0{
        return 0
    } else{
        return num
    }
}))

// 如果类型已知

let mappedNumbers = nums.map({ number in 3 * number })
print(mappedNumbers)

// 可以通过参数位置而不是参数名字来引用参数

let sortedNumbers = nums.sorted { $0 > $1 }
print(sortedNumbers)


// 对象和类

class Shape {
    var numberOfSides = 0
    func simpleDesc() -> String {
        return "A Shapge with \(numberOfSides) sides."
    }
}

var shape = Shape()
shape.numberOfSides = 7
var shapeDesc = shape.simpleDesc()


// 构造函数

class NamedShape{
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}


// 继承

class Square: NamedShape{
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
}

let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()


class Circle: NamedShape{
    var radius: Double
    
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
    }
    
    func area() -> Double {
        return 2 * Double.pi * radius * radius
    }
    
    override func simpleDescription() -> String {
        return "A Circle with radius of length \(radius)"
    }
}

let testCircle = Circle(radius: 2, name: "little dot")
testCircle.area()
testCircle.simpleDescription()


// 除了储存简单的属性之外，属性可以有 getter 和 setter

class EquilateralTriangle: NamedShape{
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with side of length \(sideLength)"
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)
triangle.simpleDescription()

// 👆 类的构造器之行了三步
// 1. 设置子类声明的属性址
// 2. 调用父类的构造期
// 3. 改变父类定义的属性址

// 如果你不需要计算属性，但是仍然需要在设置一个新值之前或者之后运行代码，使用 willSet 和 didSet。
// 写入的代码会在属性值发生改变时调用，但不包含构造器中发生值改变的情况。比如，下面的类确保三角形的边长总是和正方形的边长相同。

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)


// 处理变量的可选值时，你可以在操作（比如方法、属性和子脚本）之前加 ?

let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength




// 枚举和结构体
// 使用 enum 来创建一个枚举。就像类和其他所有命名类型一样，枚举可以包含方法

enum Rank: Int{
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue


// 使用 init?(rawValue:) 初始化构造器来创建一个带有原始值的枚举成员。

if let convertedRank = Rank(rawValue: 3){
    let threeDescription = convertedRank.simpleDescription()
}


// 枚举的关联值是实际值，并不是原始值的另一种表达方法
// 实际上，如果没有比较有意义的原始值，你就不需要提供原始值

enum Suit{
    case spades, hearts, diamonds, clubs
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()


// 如果枚举成员的实例有原始值，那么这些值是在声明的时候就已经决定了，这意味着不同的枚举成员总会有一个相同的原始值
// 当然我们也可以为枚举成员设定关联值，关联值是在创建实例时决定的。这意味着不同的枚举成员的关联值都可以不同

enum ServerResponse{
    case result(String, String)
    case failure(String)
}
let success = ServerResponse.result("6:00 am", "8:00 pm")
let failure = ServerResponse.failure("Out of cheese")
switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset)")
case let .failure(message):
    print("Failure... \(message)")
}







