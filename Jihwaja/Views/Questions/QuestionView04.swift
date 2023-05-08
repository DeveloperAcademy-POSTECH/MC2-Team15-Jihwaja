//
//  QuestionView04.swift
//  Jihwaja
//
//  Created by Minkyung Kim on 2023/05/02.
//

import SwiftUI

struct QuestionView04: View {
    
    @State private var isActiveQ4 = false
    @State private var text : String = ""

    var body: some View {
        NavigationView{
            VStack{
                QuestionView(question: "💀 곽애숙씨가 훗날 기억되길 원하는 문구가 있다면 적어주세요!")
               
               Image("gravestone")
                    .overlay{
                        ZStack{
                            Text("이곳에 적어주세요")
                                .opacity(text.isEmpty ? 1 : 0)
                            TextEditor(
                                text: $text)
                            //.opacity(0.5)
                            .padding()
                            .border(.red)
                            .scrollContentBackground(.hidden)
                        }
                    }
                .padding()
                Spacer()
                StoreButtonView(isActive: isActiveQ4)
            }
        }
    }
}


struct QuestionView04_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView04()
    }
}
