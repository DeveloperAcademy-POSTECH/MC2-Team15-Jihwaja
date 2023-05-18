//
//  FinalQ9.swift
//  Jihwaja
//
//  Created by SY AN on 2023/05/18.
//

import SwiftUI

struct FinalQ9: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var store: JihwajaStore
    
    @State private var lines = [Line]()
    @State private var deletedLines = [Line]()
    @State private var brushColor: Color = .black
    @State private var brushWidth: CGFloat = 10
    
    @State private var isBlack: Bool = false
    @State private var isRed: Bool = false
    @State private var isBlue: Bool = false
    @State private var isYellow: Bool = false
    
    @State var showModal = true
    
    let lightGray = Color("lightGray")
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    // 질문 뷰
                    HStack{
                        ZStack {
                            Image("background")
                                .resizable()
                                .scaledToFill()
                                .frame(width: getWidth() * 0.08, height: getWidth() * 0.1)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                            
                            
                            Image("cardDesign08")
                                .resizable()
                                .scaledToFill()
                                .frame(width: getWidth() * 0.06, height: getWidth() * 0.08)
                                .cornerRadius(7)
                        }
                        Text("\(store.jihwaja.A1)씨가 기억되고 싶은 표정은")
                        Spacer()
                    }
                    
                    Rectangle()
                        .frame(width: getWidth() * 0.74, height: getHeight() * 0.45)
                        .foregroundColor(lightGray)
                        .cornerRadius(10)
                    
                    
                    
                }
            }.onAppear {
                lines = store.jihwaja.A9
            }
            
            // DrawingShape 호출
            ForEach(lines) { line in
                DrawingShape(points: line.points)
                    .stroke(line.color, style: StrokeStyle(lineWidth: line.lineWidth, lineCap: .round, lineJoin: .round))
            }
        }.gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local).onChanged({ value in
            let newPoint = value.location
            if value.location.x > getWidth() * 0.15 && value.location.x < getWidth() * 0.85 && value.location.y > getHeight() * 0.17 && value.location.y < getHeight() * 0.61 {
                if value.translation.width + value.translation.height == 0 {
                    lines.append(Line(points: [newPoint], color: brushColor, lineWidth: brushWidth))
                } else {
                    let index = lines.count - 1
                    lines[index].points.append(newPoint)
                }
            }
        })
            .onEnded({ value in
                if let lastLine = lines.last?.points, lastLine.isEmpty { lines.removeLast() }
            })
        )
        .disabled(store.jihwaja.isCompleted[8])
        
    }
}



struct FinalQ9_Previews: PreviewProvider {
    static var previews: some View {
        FinalQ9()
    }
}
