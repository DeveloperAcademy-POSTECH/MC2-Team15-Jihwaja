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
    var A7 : String
    var A11 : [Double]
    
    
    init(isFirst: Bool, isCompleted: [Bool], isFlipped: [Bool], A1: String, A2: Double, A3: [CGPoint], A4: String, A5: CGFloat, A6: String, A7: String, A11 : [Double]) {
        self.isFirst = isFirst
        self.isCompleted = isCompleted
        self.isFlipped = isFlipped
        self.A1 = A1
        self.A2 = A2
        self.A3 = A3
        self.A4 = A4
        self.A5 = A5
        self.A6 = A6
        self.A7 = A7
        self.A11 = A11
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
                  A7: "",
                  A11: [0.0, 0.0, 0.0, 0.0]
    )
}

