//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct TimeTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimeTable(multiplier: 3)
print("\(threeTimesTable[10])")


struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows:Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating:0.0, count:rows*columns)
    }
    
    func indexIsValidForRow(row:Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValidForRow(row: row, column: column),"Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValidForRow(row: row, column: column),"Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)

matrix[0,1] = 1.5
matrix[1,0] = 3.2

//let someValue = matrix[2,2]
