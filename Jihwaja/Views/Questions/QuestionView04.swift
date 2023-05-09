//
//  QuestionView04.swift
//  Jihwaja
//
//  Created by Minkyung Kim on 2023/05/02.
//

import SwiftUI

struct QuestionView04: View {
    
    @State private var text : String = ""

    var body: some View {
        NavigationView{
            VStack{
                QuestionView(question: "💀 곽애숙씨가 훗날 기억되길 원하는 문구가 있다면 적어주세요!")
               Image("gravestone")
                    .overlay {
                        Text("이곳에 적어주세요")
                            .opacity(text.isEmpty ? 1 : 0)
                                //geometryReader에 대한 공부 필요...
                            GeometryReader{ geometry in
                                TextEditor(
                                    text: $text
                                )
                                .border(.red)
                                .padding(.top, geometry.size.height * 0.1)
                                .scrollContentBackground(.hidden)
                                .multilineTextAlignment(.center)
                                .frame(width: geometry.size.width * 0.7, height: geometry.size.height/2, alignment: .center)
                                .frame(width: geometry.size.width, height: geometry.size.height)
                            }
                    }
                .padding()
                .border(.pink)
                Spacer()
                StoreButtonView(isActive: !text.isEmpty)
            }
        }
    }
}

struct QuestionView04_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView04()
    }
}
