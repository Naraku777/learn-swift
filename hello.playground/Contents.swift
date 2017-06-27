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




