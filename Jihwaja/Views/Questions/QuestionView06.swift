//
//  QuestionView06.swift
//  Jihwaja
//
//  Created by ffffff on 2023/05/02.
//

import SwiftUI

struct QuestionView06: View {
    @State var food : String = ""
    @State var isActive : Bool = false
    @State private var showModal = false
    
    var body: some View {
        
        VStack{
            ScrollView{
                // 질문 뷰
                QuestionView(question: "⚒️ 곽애숙씨가 고치고 싶은\n습관을 적어주세요!")
                
                // 답변 TextEditor
                TextEditor(text: $food)
                    .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .cornerRadius(15)
                    .frame(width: getWidth() * 0.78, height: getHeight() * 0.15)
                
                Spacer()
            }
            
            // 저장 버튼
            Button(action:{
                self.showModal = true
                // 여섯 번째 답변 저장
            }){
                // name.isEmpty == false 이면 isActive true
                StoreButtonView(isActive: !food.isEmpty)
            }
            .sheet(isPresented: self.$showModal) {
                HalfModalView(imageName: "test_gif", title: "힘껏 문지르기", content: "고치고 싶은 습관이 고쳐지길\n바라면서 힘껏 문질러주세요")
            }
        }
        .onAppear {
            // View가 로드될 때 키보드를 자동으로 띄워줌
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                UIApplication.shared.sendAction(#selector(UIResponder.becomeFirstResponder), to: nil, from: nil, for: nil)
            }
        }
        
        .onTapGesture {
            // 키보드 외 영역 터치 시 키보드를 내리도록 함
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }

    }
}

struct QuestionView06_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView06()
    }
}
