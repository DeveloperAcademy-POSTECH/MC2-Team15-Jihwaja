//
//  QuestionView09.swift
//  Jihwaja
//
//  Created by ffffff on 2023/05/02.
//

import SwiftUI

struct QuestionView09: View {
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
    
    let lightGray = Color("lightGray")
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    // 질문 뷰
                    QuestionView(question: "👻 \(store.jihwaja.A1)씨는 어떤 표정으로\n기억되었으면 좋겠나요?")
                    
                    Rectangle()
                        .frame(width: getWidth() * 0.74, height: getHeight() * 0.45)
                        .foregroundColor(lightGray)
                        .cornerRadius(10)
                    
                    Text("")
                    Spacer()
                    Text("") // Spacer 왜 안되는지 모르겠음,,
                    
                    VStack {
                        HStack {
                            Circle()
                                .foregroundColor(Color.black)
                                .frame(width: getWidth() * 0.07)
                                .opacity(isBlack ? 0.5 : 1.0)
                                .scaleEffect(isBlack ? 1.2 : 1.0)
                                .padding(.horizontal, getWidth() * 0.03)
                                .pressEvents {
                                    withAnimation(.easeIn(duration: 0.1)) {
                                        brushColor = .black
                                        isBlack = true
                                    }
                                } onRelease: {
                                    withAnimation {
                                        isBlack = false
                                    }
                                }
                            
                            Circle()
                                .foregroundColor(Color.red)
                                .frame(width: getWidth() * 0.07)
                                .opacity(isRed ? 0.5 : 1.0)
                                .scaleEffect(isRed ? 1.2 : 1.0)
                                .padding(.horizontal, getWidth() * 0.03)
                                .pressEvents {
                                    withAnimation(.easeIn(duration: 0.1)) {
                                        brushColor = .red
                                        isRed = true
                                    }
                                } onRelease: {
                                    withAnimation {
                                        isRed = false
                                    }
                                }
                            
                            Circle()
                                .foregroundColor(Color.blue)
                                .frame(width: getWidth() * 0.07)
                                .opacity(isBlue ? 0.5 : 1.0)
                                .scaleEffect(isBlue ? 1.2 : 1.0)
                                .padding(.horizontal, getWidth() * 0.03)
                                .pressEvents {
                                    withAnimation(.easeIn(duration: 0.1)) {
                                        brushColor = .blue
                                        isBlue = true
                                    }
                                } onRelease: {
                                    withAnimation {
                                        isBlue = false
                                    }
                                }
                            
                            Circle()
                                .foregroundColor(Color.yellow)
                                .frame(width: getWidth() * 0.07)
                                .opacity(isYellow ? 0.5 : 1.0)
                                .scaleEffect(isYellow ? 1.2 : 1.0)
                                .padding(.leading, getWidth() * 0.03)
                                .padding(.trailing, getWidth() * 0.06)
                                .pressEvents {
                                    withAnimation(.easeIn(duration: 0.1)) {
                                        brushColor = .yellow
                                        isYellow = true
                                    }
                                } onRelease: {
                                    withAnimation {
                                        isYellow = false
                                    }
                                }
                            
                            Image(systemName: "arrow.counterclockwise")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: getWidth() * 0.06)
                                .font(Font.title.weight(.heavy))
                                .foregroundColor(Color(UIColor.tertiaryLabel))
                                .pressEvents {
                                    withAnimation(.easeIn(duration: 0.1)) {
                                        if !lines.isEmpty {
                                            let lastLine = lines.removeLast()
                                            deletedLines.append(lastLine)
                                        }
                                    }
                                } onRelease: {
                                    withAnimation {
                                        isYellow = false
                                    }
                                }
                        }
                        Color.white.opacity(0.01)
                        
                        // 저장 버튼
                        Button(action:{
                            // MainView 로 넘어가는 코드
                            store.jihwaja.A9 = lines
                        }){
                            // lines.isEmpty == false 이면 isActive true
                            StoreButtonView(isActive: !lines.isEmpty)
                        }
                    }
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
        }).onEnded({ value in
            if let lastLine = lines.last?.points, lastLine.isEmpty { lines.removeLast() }
        }))
    }
}

struct QuestionView09_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView09()
    }
}
