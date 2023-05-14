//
//  QuestionView11.swift
//  Jihwaja
//
//  Created by #ffffff on 2023/05/02.
//

import SwiftUI

struct QuestionView11: View {
    @EnvironmentObject var store: JihwajaStore
    @Environment(\.presentationMode) var presentationMode

    @State private var isActiveQ11 = false
    @State private var sliderValues = [0.0, 0.0, 0.0, 0.0]
    
    var body: some View {
       
            VStack{
                // 질문 뷰
                QuestionView(question: "📈 각 나이대별로 \(store.jihwaja.A1)씨가 행복했던 정도를 표시해주세요.")

                
                Spacer()
                    .frame(width: getWidth() * 1, height: getHeight() * 0.08)
                
                
                // 답변 뷰
                ZStack {
                    Image("Q11GraphBg")
                        .resizable()
                        .frame(width: getWidth() * 0.9, height: getWidth() * 1)
                    //하드코딩....
                        .padding(.top, -18)
                    
                    
                    // 슬라이더 핸들들이 이어진 Path
                    Path { path in
                        path.move(to: CGPoint(x: 68+32, y: CGFloat(sliderValues[0]) + 250))
                        path.addLine(to: CGPoint(x: 142+35, y: CGFloat(sliderValues[1]) + 250))
                        path.addLine(to: CGPoint(x: 216+35, y: CGFloat(sliderValues[2]) + 250))
                        path.addLine(to: CGPoint(x: 290+35, y: CGFloat(sliderValues[3]) + 250))
                    }
                    .stroke(Color.green, lineWidth: 3)

                    // 슬라이더 핸들들
                    HStack {
                        SliderView(height: 300, value: $sliderValues[0])
                            .frame(width: getWidth() * 0.17)
                            .disabled(store.jihwaja.isCompleted[10])
                        SliderView(height: 300, value: $sliderValues[1])
                            .frame(width: getWidth() * 0.17)
                            .disabled(store.jihwaja.isCompleted[10])
                        SliderView(height: 300, value: $sliderValues[2])
                            .frame(width: getWidth() * 0.17)
                            .disabled(store.jihwaja.isCompleted[10])
                        SliderView(height: 300, value: $sliderValues[3])
                            .frame(width: getWidth() * 0.17)
                            .disabled(store.jihwaja.isCompleted[10])
                            
                        
                    }
                    .frame(height: 500)
                    .padding(.horizontal, 20)
                    .offset(x: 36)
                    .onChange(of: sliderValues) { _ in
                        isActiveQ11 = true
                    }

                    
                }
                .padding()
                .frame(height: 300)
                
                Spacer()
                
                // 저장 버튼
                Button(action: {
                    store.jihwaja.A11 = sliderValues
                    store.jihwaja.isCompleted[10] = true
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    StoreButtonView(isActive: isActiveQ11)
                }).disabled(!isActiveQ11)
                    .opacity(store.jihwaja.isCompleted[10] == true ? 0: 1)
                
            }
            .onAppear{
                sliderValues = store.jihwaja.A11
            }
    }
}

struct SliderView: View {
    let height: CGFloat
    @Binding var value: Double
    
    var body: some View {
        VStack {
            ZStack() {
                Rectangle()
                    .fill(Color("lightGray"))
                    .frame(width: 6, height: self.height)
                
                HStack {
                    Circle()
                        .fill(Color("green"))
                        .frame(width: 25, height: 25)
                        .offset(y: self.value)
                        .gesture(DragGesture()
                            .onChanged({ value in
                                if value.location.y < height / 2 && value.location.y > height / 2 * -1 {
                                    self.value = value.location.y
                                }
                            }))
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
