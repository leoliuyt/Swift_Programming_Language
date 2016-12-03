//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//: Property Inheritance & override
class PropertyInheritance {
    var tmpValue: String = ""
    let constantValue = "ConstantValue"
    var storedProperty: String = "StoredProperty"
    var readOnlyProperty: String {
        return "Read Only"
    }
    var readWriteProperty: String {
        get {
            return "Read Write get"
        }
        set {
            tmpValue = "Read Write set"
        }
    }
    
    var storedPropertyObserver: String = "StoredProperty Observer"
    var readOnlyPropertyObserver: String {
        return "Read Only Observer"
    }
    var readWritePropertyObserver: String {
        get {
            return "Read Write Observer get"
        }
        set {
            tmpValue = "Read Write Observer set"
        }
    }
}

class SubPropertyInheritance: PropertyInheritance {
    //重写存储属性 -> 读写 存储属性只能被重写成读写
    override var storedProperty: String {
        get {
            return "override storedProperty"
        }
        set {
            tmpValue = newValue
        }
    }
    //重写只读-> 只读\读写
    override var readOnlyProperty: String {
        get {
            return "override read only get"
        }
        set {
            tmpValue = "override read only set"
        }
    }
    //重写读写属性 -> 读写 不能 重写读写属性 -> 只读
    override var readWriteProperty: String {
        get {
            return "override read write get"
        }
        set {
            tmpValue = "override read write set"
        }
    }
    
    //let 关键词不能用于计算属性  所以 不能被重写
//    override let constantValue: String {
//        return "constantValue"
//    }
    
    override var storedPropertyObserver: String {
        willSet{
            tmpValue = newValue
            print("newValue:\(newValue)")
        }
        didSet{
            tmpValue = oldValue
            print("currentValue:\(storedPropertyObserver) oldValue:\(oldValue)")
        }
    }
    
    //不能观察只读属性
//    override var readOnlyPropertyObserver: String {
//        willSet{
//            tmpValue = newValue
//            print("newValue:\(newValue)")
//        }
//        didSet{
//            tmpValue = oldValue
//            print("currentValue:\(storedPropertyObserver) oldValue:\(oldValue)")
//        }
//    }
    
    //重写了 观察属性 就不可以重写getter setter
    override var readWritePropertyObserver: String {
        willSet{
            tmpValue = newValue
            print("newValue:\(newValue)")
        }
        didSet{
            tmpValue = oldValue
            print("currentValue:\(storedPropertyObserver) oldValue:\(oldValue)")
        }
    }
}

//: Method Inheritance & override

class MethodInheritance {
    func methodFun(){
        print("method fun")
    }
}

extension MethodInheritance {
    func extensionMethod() {
        print("extension method")
    }
}

class SubMethodInheritance: MethodInheritance {
    override func methodFun() {
        print("override method fun")
    }
//不能重写父类分类的方法
//    override func extensionMethod() {
//        print("override extension method")
//    }
}

//:Preventing Overrides

class PreventOverride {
    final var aa = "aa"
}

class SubPreventOverride: PreventOverride{
    //不能重写 aa
}

final class PreventOverrideA {
    
}

//不能继承被final 修饰的class
//class SubPreventOverrideA: PreventOverrideA {
//
//}


