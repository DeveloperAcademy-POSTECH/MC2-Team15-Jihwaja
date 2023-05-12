//
//  QuestionView02.swift
//  Jihwaja
//
//  Created by Minkyung Kim on 2023/05/02.
//

import SwiftUI

struct QuestionView02: View {
    @State private var yes = 1.0
    @State private var isActiveQ2 = false
    
    var body: some View {
        
        VStack{
            // 질문
            QuestionView(question: "🙋🏻‍♀️곽애숙씨는 지금까지\n 진정으로 원하는 삶을 살았나요?")
            Spacer()
            
            //답변 영역
            VStack{
                Text("네!")
                    // 슬라이더에서 변경되는 $yes에 따라 font size 변경
                    .font(.system(size:(10 * (yes/5))))
                    .foregroundColor(Color("green"))
            }.frame(width: getWidth(), height: getHeight() * 0.4)
            
            // 슬라이더
            Slider(
                //value: slider로 변경되는 값
                value: $yes,
                
                // in: value가 변경될 수 있는 범위
                // $yes가 0이 되면 "네"의 크기가 자동으로 초기값이 되는 것을 방지하기 위해 1~101까지
                in: 1...101,
                
                // step: value가 변경되는 단위
                step: 1
            )
            .onChange(of: yes) { _ in
                
                // Slider 값이 변경되면 버튼 Activate
                isActiveQ2 = true
            }
            .accentColor(Color("green"))
            
            // % 텍스트
            Text("\(Int(yes)-1) %")
            
            //저장 버튼
            StoreButtonView(isActive: isActiveQ2)
        }
        .padding(.horizontal)
    }
    
}

struct QuestionView02_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView02()
    }
}
