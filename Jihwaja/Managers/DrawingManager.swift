//
//  DrawingManager.swift
//  Jihwaja
//
//  Created by ffffff on 2023/05/09.
//

import SwiftUI

class DrawingManager {
    func createPath(for points: [CGPoint]) -> Path {
        var path = Path()
        if let firstPoint = points.first {
            path.move(to: firstPoint)
        }
        
        for index in 1..<points.count {
            let mid = calculateMidPoint(points[index - 1], points[index])
            path.addQuadCurve(to: mid, control: points[index - 1])
        }
        
        if let last = points.last {
            path.addLine(to: last)
        }
        return path
    }
    
    func calculateMidPoint(_ point1: CGPoint, _ point2: CGPoint) -> CGPoint {
        let midPoint = CGPoint(x: (point1.x + point2.x) / 2, y: (point1.y + point2.y) / 2)
        return midPoint
    }
}

struct DrawingShape: Shape {
    let points: [CGPoint]
    let manager = DrawingManager()
    
    func path(in rect: CGRect) -> Path {
        manager.createPath(for: points)
    }
}

struct Line: Identifiable, Codable {
    var points: [CGPoint]
    var color: Color
    var lineWidth: CGFloat
    var id = UUID()
}
