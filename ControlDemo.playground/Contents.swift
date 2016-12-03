//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let finalSquare = 25
var board = [Int](repeating:0,count:finalSquare+1)

board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
var square = 0
var diceRoll = 0


// > 25

//while
//while square < finalSquare {
//    diceRoll += 1
//    if diceRoll == 7 {
//        diceRoll = 1
//    }
//    
//    square += diceRoll
//    
//    if(square < board.count) {
//        square += board[square]
//    }
//}
//
//print("Game over!")

//repeat while

//repeat {
//    square += board[square]
//    
//    diceRoll += 1
//    if diceRoll == 7 {
//        diceRoll = 1
//    }
//    
//    square += diceRoll
//    
//}while(square < finalSquare)

// == 25

goloop: while square != finalSquare {
    diceRoll += 1
    if diceRoll == 7 {
        diceRoll = 1
    }
    print("step :\(square)" + " roll :\(diceRoll)")
    switch square + diceRoll {
    case finalSquare:
        break goloop
    case let newSquare where newSquare > finalSquare :
        continue goloop
    default:
        square += diceRoll
        square += board[square]
    }
}

print("Game over!")

