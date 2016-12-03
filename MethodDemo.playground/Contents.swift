//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct SomeStruct{
    static func aa(){
        print("aa")
//        return SomeStruct()
    }
    
    static func bb(){
        aa()
        print("bbb")
    }
}

struct LevelTracker {
    static var hightestUnlockLevel = 1
    var currentLevel = 1
    static func unlock(_ level: Int){
        if level > hightestUnlockLevel {
            hightestUnlockLevel = level
        }
    }
    
    static func isUnlocked(_ level: Int) -> Bool{
        return level <= hightestUnlockLevel
    }
    
    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player{
    var tracker = LevelTracker()
    let playerName: String
    func completedLevel(level: Int){
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    
    init(name: String){
        playerName = name
    }
}

var player = Player(name: "Argyrios")
player.completedLevel(level: 1)
print("highest unlocked level is now \(LevelTracker.hightestUnlockLevel)")

player = Player(name: "Beto")
if player.tracker.advance(to: 6) {
    print("player is now on level 6")
} else {
    print("level 6 has not yet been unlocked")
}
