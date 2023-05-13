//
//  QuestionView01.swift
//  Jihwaja
//
//  Created by Minkyung Kim on 2023/05/02.
//

import SwiftUI

struct QuestionView01: View {
    @State var name : String = ""
    //@State private var buttonPressed = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
            VStack{
                
                    // 질문 뷰
                    QuestionView(question: "❓우리와 함께하고 있는\n당신의 이름은 무엇인가요?")
                    
                    // 답변 TextField
                    TextField("이름을 입력해 주세요.", text: $name)
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .cornerRadius(15)
                        .frame(width: getWidth() * 0.78, height: getHeight() * 0.06)
                    
                    Spacer()
                
                
                // 저장 버튼
                Button(action: {
                                self.presentationMode.wrappedValue.dismiss()
                            }, label: {
                    StoreButtonView(isActive: !name.isEmpty)
                }).disabled(name.isEmpty)
                    
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
}

struct QuestionView01_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView01()
    }
}
