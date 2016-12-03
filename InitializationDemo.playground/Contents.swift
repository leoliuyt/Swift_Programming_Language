//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class StoredPropertiesClass {
    var a: Int
    let b: Int = 11
    let c: Int
    init() {
        a = 1
        c = 2
    }
}

var storedPropertiesClass = StoredPropertiesClass()
storedPropertiesClass.a
storedPropertiesClass.b
storedPropertiesClass.c

struct MemberwiseStruct {
    var a: Int = 0
    var b: Int = 0
    
//    init(number a: Int) {
//        self.a = a
//    }
}

//: Memberwise Initializers of Structure Types

//如果struct中的属性 没有初始值 那么不能使用默认初始化器
//只能通过memberwise initializer 来初始化
//对于class 使用defaul initializer 无需关心class中的属性是否已经有初始值

var memberwise = MemberwiseStruct(a: 1, b: 2)
//var custom = MemberwiseStruct(number: 1);

// error for struct
//var defaultStruct = MemberwiseStruct()
//var defaultStruct = MemberwiseStruct(10)

//:Class Inheritance and Initialization

//:Designated Initializer

class DesignatedClass {
    var a: Int;
    var b: Int;
    let c: Int;
    
    init() {
        a = 10
        b = 11
        c = 12
    }
    
    convenience init(a: Int) {
        self.init()
        self.a = a
    }
    
    convenience init (b: Int) {
        self.init(a:1000)
        self.b = b
    }
}

var designated = DesignatedClass()
designated.a
designated.b
designated.c

var other = DesignatedClass(a: 100)
other.a
other.b
other.c

var convenience = DesignatedClass(b: 110)
convenience.a
convenience.b
convenience.c


class SubDesignatedClass: DesignatedClass {
    var d: Int
    var f: Int
    init(d: Int, f: Int) {
        self.d = d
        self.f = f
    }
    
    convenience init(d: Int) {
        self.init(d:d,f:150)
    }
    
    var e: Int = {
        return 16
    }()
}

var subDesignated = SubDesignatedClass(d: 14,f: 15)
subDesignated.e

//: Setting a Default Property Value with a Closure or Function
class SomeClass {
    let someProperty: Int = {
       print("enter closure")
        return 10
    }()
    
    var a: Int
    init() {
        self.a = 20
        print("enter init")
    }
}


let some = SomeClass()



