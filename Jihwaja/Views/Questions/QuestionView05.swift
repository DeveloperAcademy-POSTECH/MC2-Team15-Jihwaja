//
//  QuestionView05.swift
//  Jihwaja
//
//  Created by Minkyung Kim on 2023/05/02.
//

import SwiftUI

struct QuestionView05: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var store: JihwajaStore
    
    
    @State private var scale: CGFloat = 0.4
    @State private var isActiveQ5 = false
    @State private var showModal = true

        var body: some View {
            VStack{
                // 질문
                QuestionView(question: "😄 지금 \(store.jihwaja.A1)씨가 느끼고 있는\n행복의 크기를 알려주세요!")
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
                        .gesture(!store.jihwaja.isCompleted[4] ?
                                MagnificationGesture().onChanged { value in
                                    self.scale = min(value, 4.0)
                                    isActiveQ5 = true
                                } : nil)
                }
                
                // % 텍스트
                Text("\(Int(scale * 25))%")
                                .padding()
                                .font(.title)
                                .fontWeight(.bold)
                
                Spacer()
                //저장 버튼
                Button(action: {
                    store.jihwaja.A5 = Double(scale)
                    store.jihwaja.isCompleted[4] = true
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    StoreButtonView(isActive: isActiveQ5)
                })
                //.disabled(!isActiveQ5)
                    .opacity(store.jihwaja.isCompleted[4] == true ? 0: 1)
                    .sheet(isPresented: store.jihwaja.isCompleted[4] ? .constant(false) : $showModal)
                    
                    {
                    HalfModalView(imageName:"Q5_motion", title: "손가락 벌리기", content: "답변의 크기만큼 손가락을 벌려\n원의 크기를 설정해주세요!", showModal: $showModal)
                    }
                    
            }
            .onAppear{
                scale = CGFloat(store.jihwaja.A5)
            }
        }
}
    
    struct QuestionView05_Previews: PreviewProvider {
        static var previews: some View {
            QuestionView05()
        }
    }
