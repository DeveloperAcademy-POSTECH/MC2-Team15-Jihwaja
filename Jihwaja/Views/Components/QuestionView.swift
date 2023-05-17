//
//  QuestionView.swift
//  Jihwaja
//
//  Created by SY AN on 2023/05/04.
//

import SwiftUI


struct QuestionView: View {
    var question: String
    var body: some View {
        VStack{
            Text(question)
                .font(.system(size: 22))
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
        }
        .padding(.top, getWidth() * 0.1)
        .padding(.bottom, getWidth() * 0.1)
        .padding(.horizontal, getWidth() * 0.1)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(question:"❓우리와 함께하고 있는\n당신의 이름은 무엇인가요?")
    }
}
