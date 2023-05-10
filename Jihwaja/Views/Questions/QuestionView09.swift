//
//  QuestionView09.swift
//  Jihwaja
//
//  Created by ffffff on 2023/05/02.
//

import SwiftUI

struct QuestionView09: View {
    @State private var lines = [Line]()
    @State private var deletedLines = [Line]()
    @State private var brushColor: Color = .black
    @State private var brushWidth: CGFloat = 10
    
    @State private var isBlack: Bool = false
    @State private var isRed: Bool = false
    @State private var isBlue: Bool = false
    @State private var isYellow: Bool = false
    
    var body: some View {
        ZStack {
            VStack{
                ScrollView{
                    // 질문 뷰
                    QuestionView(question: "👻 곽애숙씨는 어떤 표정으로\n기억되었으면 좋겠나요?")
                    
                    Spacer()
                }
            }
            
            // DrawingShape 호출
            ForEach(lines) { line in
                DrawingShape(points: line.points)
                    .stroke(line.color, style: StrokeStyle(lineWidth: line.lineWidth, lineCap: .round, lineJoin: .round))
            }
        }.gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local).onChanged({ value in
            let newPoint = value.location
            if value.translation.width + value.translation.height == 0 {
                lines.append(Line(points: [newPoint], color: brushColor, lineWidth: brushWidth))
            } else {
                let index = lines.count - 1
                lines[index].points.append(newPoint)
            }
        }).onEnded({ value in
            if let lastLine = lines.last?.points, lastLine.isEmpty { lines.removeLast() }
        }))
        
        VStack {
            Spacer()
            
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
            }
            
            // 저장 버튼
            Button(action:{
                // MainView 로 넘어가는 코드
                
            }){
                // lines.isEmpty == false 이면 isActive true
                StoreButtonView(isActive: !lines.isEmpty)
            }
        }
    }
}

struct QuestionView09_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView09()
    }
}
