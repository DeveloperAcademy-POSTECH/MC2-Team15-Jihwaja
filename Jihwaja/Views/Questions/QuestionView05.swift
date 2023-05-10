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
                QuestionView(question: "😄 지금 곽애숙씨가 느끼고 있는\n행복의 크기를 알려주세요!")
                Spacer()
               
                ZStack{
                    Circle()
                        .frame(width:getWidth() * 0.2 * scale)
                        .foregroundColor(Color("green"))
                    
                    Circle()
                        .foregroundColor(Color("green"))
                        .opacity(0.1)
                        .frame(width: getWidth() * 0.8)
                        .gesture(
                            MagnificationGesture()
                                .onChanged { value in
                                    self.scale = min(value, 4.0)
                                    isActiveQ5 = true
                                }
                        )
                }
                
                Text("\(Int(scale * 25))%")
                                .padding()
                                .font(.title)
                                .fontWeight(.bold)
                
                
                Spacer()
                StoreButtonView(isActive: isActiveQ5)
            }
        }
}

struct QuestionView05_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView05()
    }
}
