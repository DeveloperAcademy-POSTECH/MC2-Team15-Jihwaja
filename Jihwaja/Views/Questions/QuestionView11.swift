//
//  QuestionView11.swift
//  Jihwaja
//
//  Created by Minkyung Kim on 2023/05/02.
//

import SwiftUI

extension Color {
    static let lightGray = Color("lightGray")
}

let IMAGE_WIDTH: CGFloat = 300
let IMAGE_HEIGHT: CGFloat = 200

struct QuestionView11: View {
    
    @State var graph : String = ""
    @State private var sliderValues = [0.0, 0.0, 0.0, 0.0]
    
    var body: some View {
        NavigationView{
            VStack{
                // 질문 뷰
                QuestionView(question: "📈 각 나이대별로 곽애숙씨가 행복했던 정도를 표시해주세요.")
//                    .background(Color.red)
                
                Spacer()
                    .frame(width: getWidth() * 1, height: getHeight() * 0.08)
                
                
                // 답변 뷰
                ZStack {
                  
                    HStack {
                        Image("Q11GraphBg")
                            .resizable()
                            .frame(width: getWidth() * 0.9, height: getWidth() * 1)
                    }
                        
                            
                    
                    // 슬라이더 핸들들이 이어진 Path
                    Path { path in
                        path.move(to: CGPoint(x: 0, y: CGFloat(sliderValues[0])))
                        path.addLine(to: CGPoint(x: 40, y: CGFloat(sliderValues[1])))
                        path.addLine(to: CGPoint(x: 80, y: CGFloat(sliderValues[2])))
                        path.addLine(to: CGPoint(x: 120, y: CGFloat(sliderValues[3])))
                    }
                    .stroke(Color.green, lineWidth: 3)
                    
                    // 슬라이더 핸들들
                    HStack{
                        Slider(value: $sliderValues[0], in: -100...100, step: 1)
                            .rotationEffect(.degrees(90.0))
                            .accentColor(.lightGray)
                        
                        Slider(value: $sliderValues[1], in: -100...100, step: 1)
                            .rotationEffect(.degrees(90.0))
                            .accentColor(.lightGray)
                        
                        Slider(value: $sliderValues[2], in: -100...100, step: 1)
                            .rotationEffect(.degrees(90.0))
                            .accentColor(.lightGray)
                        
                        Slider(value: $sliderValues[3], in: -100...100, step: 1)
                            .rotationEffect(.degrees(90.0))
                            .accentColor(.lightGray)
                    }
                    .frame(width: getWidth() * 0.9, height: getWidth() * 1)
//                    .background(Color.green)
                }
                .padding()
                .frame(height: 300)
//                .background(Color.blue)
                
                Spacer()
                
                // 저장 버튼
                Button(action:{
                    // MainView 로 넘어가는 코드
                    
                    // 일곱 번째 답변 저장
                }){
                    // name.isEmpty == false 이면 isActive true
                    StoreButtonView(isActive: !graph.isEmpty)
                }
                
            }
        }
    }
}




struct QuestionView11_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView11()
    }
}
