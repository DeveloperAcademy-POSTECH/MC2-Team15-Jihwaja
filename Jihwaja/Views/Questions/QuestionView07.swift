//
//  QuestionView07.swift
//  Jihwaja
//
//  Created by ffffff on 2023/05/02.
//

import SwiftUI

struct QuestionView07: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var store: JihwajaStore
    @State var food : String = ""
    @State var isActive : Bool = false
    
    var body: some View {
        
        VStack{
            ScrollView{
                // 질문 뷰
                QuestionView(question: "🍛 \(store.jihwaja.A1)씨에게 추억을 떠올리게\n하는 음식과 그 추억을 말해주세요!")
                
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
                    .disabled(store.jihwaja.isCompleted[6])
                
                Spacer()
            }
            
            // 저장 버튼
            Button(action: {
                store.jihwaja.A7 = food
                store.jihwaja.isCompleted[6] = true
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                StoreButtonView(isActive: !food.isEmpty)
            }).disabled(food.isEmpty)
                .opacity(store.jihwaja.isCompleted[6] == true ? 0 : 1)
                

            
        }
        .onAppear {
            food = store.jihwaja.A7
            
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

struct QuestionView07_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView07()
    }
}
