//
//  QuestionView05.swift
//  Jihwaja
//
//  Created by Minkyung Kim on 2023/05/02.
//

import SwiftUI

struct QuestionView05: View {
    @State private var scale: CGFloat = 0.4
    @State private var isActiveQ5 = false

        var body: some View {
            VStack{
                // 질문
                QuestionView(question: "😄 지금 곽애숙씨가 느끼고 있는\n행복의 크기를 알려주세요!")
                Spacer()
               
                //답변 영역
                ZStack{
                    
                    // 작은 원
                    Circle()
                        // scale 값에 따라 크기 변경됨
                        .frame(width:getWidth() * 0.2 * scale)
                        .foregroundColor(Color("green"))
                    
                    // 큰 원
                    Circle()
                        .foregroundColor(Color("green"))
                        .opacity(0.1)
                        .frame(width: getWidth() * 0.8)
                        // 확대 축소 제스쳐
                        .gesture(
                            // MagnificationGesture: 확대 축소
                            MagnificationGesture()
                                .onChanged { value in
                                    //value의 최댓값: 무제한으로 원이 커지는 것 방지
                                    self.scale = min(value, 4.0)
                                    //원의 크기가 변경되면 저장 버튼 Activate
                                    isActiveQ5 = true
                                }
                        )
                }
                
                // % 텍스트
                Text("\(Int(scale * 25))%")
                                .padding()
                                .font(.title)
                                .fontWeight(.bold)
                
                Spacer()
                //저장 버튼
                StoreButtonView(isActive: isActiveQ5)
            }
        }
}

struct QuestionView05_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView05()
    }
}
