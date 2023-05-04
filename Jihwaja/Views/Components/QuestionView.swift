//
//  Question.swift
//  Jihwaja
//
//  Created by SY AN on 2023/05/04.
//

import SwiftUI


struct Question: View {
    var question: String
    var body: some View {
        VStack{
            Text(question)
                .font(.title2)
                .multilineTextAlignment(.center)
        }
        .padding(.top, getWidth() * 0.25)
        .padding(.bottom, getWidth() * 0.1)
    }
}

struct Question_Previews: PreviewProvider {
    static var previews: some View {
        Question(question:"❓우리와 함께하고 있는\n당신의 이름은 무엇인가요?")
    }
}
