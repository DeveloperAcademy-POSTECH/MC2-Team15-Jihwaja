//
//  jihwajaData.swift
//  Jihwaja
//
//  Created by SY AN on 2023/05/12.
//

import Foundation


struct jihwajaData : Codable {
    
    var isFirst : Bool
    var isCompleted : [Bool]
    var isFlipped : [Bool]
    var A1 : String
    var A2 : Double
    var A3 : [CGPoint]
    var A4 : String
    var A5 : CGFloat
    var A6 : String
    var A6L : [Line]
    var A7 : String
    var A8 : String
    var A9 : [Line]
    var A10 : String
    var A11 : [Double]
    var A12S : [String]
    var A12B : [Bool]
    
    
    init(isFirst: Bool, isCompleted: [Bool], isFlipped: [Bool], A1: String, A2: Double, A3: [CGPoint], A4: String, A5: CGFloat, A6: String, A6L:[Line], A7: String, A8: String, A9: [Line], A10: String, A11 : [Double], A12S: [String], A12B: [Bool]) {
        self.isFirst = isFirst
        self.isCompleted = isCompleted
        self.isFlipped = isFlipped
        self.A1 = A1
        self.A2 = A2
        self.A3 = A3
        self.A4 = A4
        self.A5 = A5
        self.A6 = A6
        self.A6L = A6L
        self.A7 = A7
        self.A8 = A8
        self.A9 = A9
        self.A10 = A10
        self.A11 = A11
        self.A12S = A12S
        self.A12B = A12B
    }
    
    static let emptyData : jihwajaData
    = jihwajaData(isFirst: true ,
                  isCompleted: [false, false, false, false, false, false, false, false, false, false, false, false],
                  isFlipped: [false, false, false, false, false, false, false, false, false, false, false, false],
                  A1: "",
                  A2: 1.0,
                  A3: Array(repeating: CGPoint(x: 50, y: 40), count: 9),
                  A4: "",
                  A5: 0.0,
                  A6: "",
                  A6L: [],
                  A7: "",
                  A8: "",
                  A9: [],
                  A10: "",
                  A11: [0.0, 0.0, 0.0, 0.0],
                  A12S: ["","","",""],
                  A12B: [false, false, false, false]
    )
}

