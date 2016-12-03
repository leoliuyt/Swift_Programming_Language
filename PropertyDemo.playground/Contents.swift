//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//: storage property
//计算属性可以由类、结构体和枚举定义。存储属性只能由类和结构体定义。
enum Planet{
//    var a = 10
    case Mars,Earth
    
    var a :Int {
        return 10
    }
}
Planet.Earth.a

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
    
//    func getMaxValue() -> Int {
//        return firstValue + length
//    }
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
//rangeOfThreeItems.getMaxValue()
rangeOfThreeItems.firstValue = 6
//rangeOfThreeItems.getMaxValue()
let rangeOfFouItems = FixedLengthRange(firstValue: 0, length: 4)
//rangeOfFouItems.firstValue = 10


//:延迟存储属性
// 延迟存储属性声明为变量（使用 var 关键字)

//如果被标记为 lazy 修饰符的属性同时被多个线程访问并且属性还没有被初始化，则无法保证属性只初始化一次

//:计算属性
//提供一个读取器和一个可选的设置器来间接得到和设置其他的属性和值。
struct Point {
    var x = 0.0,y = 0.0
}

struct Size {
    var width = 0.0,height = 0.0
}

struct Rect{
    var origin = Point()
    var size = Size()
    var center:Point{
        get{
            let centerX = origin.x + size.width/2.0
            let centerY = origin.y + size.height/2.0
            return Point(x: centerX, y: centerY)
        }
        
        set{
            origin.x = newValue.x - (size.width / 2.0)
            origin.y = newValue.y - (size.height / 2.0)
        }
    }
}

var square = Rect(origin: Point(x:0.0,y:0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center

square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at(\(square.origin.x),\(square.origin.y))")

//:属性观察者
//willSet 会在该值被存储之前被调用。
//didSet 会在一个新值被存储后被调用。

//didSet 观察者不会提供自定义的形式参数名给旧值，而是使用 oldValue 这个默认的名字
class StepCounter{
    var totalSteps:Int = 0{
        willSet(newValue){
            print("\(newValue)")
        }
        didSet{
            print("\(oldValue)")
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 100

//:全局和局部变量
//全局常量和变量永远是延迟计算的，与延迟存储属性有着相同的行为。不同于延迟存储属性，全局常量和变量不需要标记 lazy 修饰符。

//:类型属性
//类类型的计算类型属性，你可以使用 class 关键字来允许子类重写父类的实现

struct SomeStructure{
    static var storedTypeProperty = "Some Value"
    static var computedTypeProperty:Int{
        return 1
    }
}


enum SomeEnueration {
    static var storedTypeProperty = "Some Value"
    static var computedTypeProperty: Int{
        return 4
    }
}

class SomeBaseClass {
   class var overrideableComputedTypeProperty: Int {
        return 100
    }
}

class SomeClass: SomeBaseClass{
    static var storedTypeProperty = "Some Value"
    static var computedTypeProperty: Int{
        return 4
    }
    override class var overrideableComputedTypeProperty: Int{
        return 111
    }
}

let a = SomeBaseClass.overrideableComputedTypeProperty

let b = SomeClass.storedTypeProperty

let c = SomeClass.overrideableComputedTypeProperty

