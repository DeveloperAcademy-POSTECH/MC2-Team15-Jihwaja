//
//  QuestionView06.swift
//  Jihwaja
//
//  Created by ffffff on 2023/05/02.
//

import SwiftUI

struct QuestionView06: View {
    @State var habit : String = ""
    @State var isActive : Bool = false
    
    //처음 질문
    @State private var showModal = false
    //처음 질문에서 저장하기 눌렀을 때
    @State private var secondFlag = false
    //두번째 창
    @State private var eraseFlag = false
    
    var body: some View {
        ZStack {
            if eraseFlag {
                EraseView()
            } else {
                    VStack {
                        ScrollView{
                            // 질문 뷰
                            QuestionView(question: "⚒️ 곽애숙씨가 고치고 싶은\n습관을 적어주세요!")
                            
                            // 답변 TextEditor
                            TextEditor(text: $habit)
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
                
                VStack {
                    Spacer()
                    // 저장 버튼
                    Button(action:{
                                            
                        if !secondFlag {
                            self.showModal = true
                            self.secondFlag = true
                            self.eraseFlag = true
                        } else {
                            // MainView 로 넘어가는 코드
                            // 여섯 번째 답변 저장
                            print("done")
                        }
                    }) {
                        // habit.isEmpty == false 이면 isActive true
                        StoreButtonView(isActive: !habit.isEmpty)
                    }
                    .sheet(isPresented: self.$showModal) {
                        HalfModalView(imageName: "test_gif", title: "힘껏 문지르기", content: "고치고 싶은 습관이 고쳐지길\n바라면서 힘껏 문질러주세요")
                    }
                }
            }
        }
    }

struct EraseView: View {
    @State var food : String = ""
    @State var isActive : Bool = false
    
    var body: some View {
        VStack {
            ScrollView{
                // 질문 뷰
                QuestionView(question: "⚒️ 곽애숙씨의 고치고 싶은 습관이\n고쳐지길 바라면서 지워주세요")
                Spacer()
            }
        }
    }
}

struct QuestionView06_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView06()
    }
}
